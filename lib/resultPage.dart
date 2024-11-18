import "dart:convert";
import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:google_generative_ai/google_generative_ai.dart" as gen_ai;

class ResultPage extends StatefulWidget {
  final String imagePath;
  const ResultPage({required this.imagePath, super.key});
  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  // Variables
  final apiKey = "hidden";
  bool _loading = true;
  Map<String, dynamic> plantInfo = {};

  @override
  void initState() {
    super.initState();
    debugPrint("Hi Flora!");
    getPlantInfo();
  }

// main function
  void getPlantInfo() async {
    final model = gen_ai.GenerativeModel(
        model: "gemini-1.5-flash-latest", apiKey: apiKey);

    final firstImage = await rootBundle.load("assets/plant.png");
    final bytes = firstImage.buffer.asUint8List();

    debugPrint("Image loaded successfully with ${bytes.length} bytes.");
    // observe leaf color, wilting, dryness, yellow --> if plant is underwatered, healthy, or overwatered.

    // JSON

    /* {
      name: "Aloe Vera",
      species: "Aloe Vera",
      description: "Aloe Vera is a succulent plant species of the genus Aloe. It is cultivated for agricultural and medicinal uses. The species is also used for decorative purposes and grows successfully indoors as a potted plant.",
      result: "healthy",
      reasoning: "The plant is healthy because the leaves are green and firm.",
      recommendation: "Water the plant every 2-3 weeks.",
      soil_type: "Sandy",
      sunlight_exposure: "Full Sun",
      watering_schedule: "Every 2-3 weeks",
      location: "Indoor"
  } */
    String promptDescription =
        "Analyze the provided image of the plant. Based on the visual cues "
        "(such as leaf color, wilting, dryness, or yellowing), determine "
        "whether the plant is underwatered, healthy, or overwatered. "
        "Provide a JSON response that includes the result ('underwatered', "
        "'healthy', 'overwatered'), an explanation of why this result was "
        "determined, and a recommendation for the next steps the user should"
        " take to care for the plant. After that give some advice about how to judge the plant by physical touch such as checking if the stem is firm.The JSON should look like this :"
        '{"name":<plant name>","species":<species>,"description":<A long plant info>, "result": "<overwatered, underwatered or healthy>,"reasoning": "<why>", "recommendation": "<what to do>", "soil_type": "<soil_type>", "sunlight_exposure": "<sunlight_exposure>","watering_schedule": "<watering_schedule>","location": "Outdoor or Indoor", "adviceOnTouch": "<advice>"}';

    final prompt = gen_ai.TextPart(promptDescription);
    final imageParts = [
      gen_ai.DataPart('image/png', firstImage.buffer.asUint8List())
    ];

    debugPrint(imageParts.toString());

    final response = await model.generateContent([
      gen_ai.Content.multi([prompt, ...imageParts])
    ]);

    String cleanedResponse =
        response.text!.replaceAll('```json', '').replaceAll('```', '').trim();

    debugPrint(cleanedResponse);

    Map<String, dynamic> info = jsonDecode(cleanedResponse);

    // Loading = False
    setState(() {
      _loading = false;
      plantInfo = info;
    });
  }

// Above - background logic

// IGNORE the bottom
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Result"),
        ),
        body: Center(
          child: Text(plantInfo["name"]),
        ));
  }
}
