import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:google_generative_ai/google_generative_ai.dart" as gen_ai;

class ResultPage extends StatefulWidget {
  final String imagePath;
  const ResultPage({required this.imagePath, super.key});
  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    // Variables
    final apiKey = "hidden";
    bool _loading = true;
    Map<String, dynamic> plantInfo = {};

    void getPlantInfo() {
      final model = gen_ai.GenerativeModel(
          model: "gemini-1.5-flash-latest", apiKey: apiKey);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Result"),
        ),
        body: Center(
          child: Text(apiKey!),
        ));
  }
}
