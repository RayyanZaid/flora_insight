import 'package:flutter/material.dart';
import 'plantInfoPage.dart';
import 'constants.dart';
import 'cameraTab.dart';

class Plant {
  final String name;
  final int id;
  final String image;
  final String plantGuidance;

  Plant(
      {required this.name,
      required this.id,
      required this.image,
      required this.plantGuidance});
}

class MyPlantPage extends StatefulWidget {
  const MyPlantPage({super.key});

  @override
  _MyPlantPageState createState() => _MyPlantPageState();
}

class _MyPlantPageState extends State<MyPlantPage> {
  Map<String, Plant> plantsInfo = {
    "2024-10-01": Plant(
      name: "Aloe Vera",
      id: 1,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-02": Plant(
      name: "Spider Plant",
      id: 2,
      image: 'assets/Spider_plant.jpg',
      plantGuidance: "a",
    ),
    "2024-10-03": Plant(
      name: "Snake Plant",
      id: 3,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-04": Plant(
      name: "Peace Lily",
      id: 4,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-05": Plant(
      name: "Rubber Plant",
      id: 5,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-06": Plant(
      name: "Pothos",
      id: 6,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-07": Plant(
      name: "Bamboo Palm",
      id: 7,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-08": Plant(
      name: "Fiddle Leaf Fig",
      id: 8,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-09": Plant(
      name: "Boston Fern",
      id: 9,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
    "2024-10-10": Plant(
      name: "Areca Palm",
      id: 10,
      image: 'assets/Aloe Vera.jpeg',
      plantGuidance: "a",
    ),
  };

  @override
  void initState() {
    super.initState();
    getPlantInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // make the background the primary color from constants.dart
      backgroundColor: primaryColor.withOpacity(0.1),
      appBar: AppBar(
          title: const Text('My Plants'),
          leading: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Image.asset("assets/logo.png"),
          )),

      // Conditional Rendering

      // Can you create a Column with a children array?
      body: (plantsInfo.isNotEmpty)
          ? Center(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: plantsInfo.length,
                      itemBuilder: (context, index) {
                        String dateTaken = plantsInfo.keys.elementAt(index);
                        Plant plantValue = plantsInfo.values.elementAt(index);

                        return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              color: secondaryColor.withOpacity(0.3),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlantInfoPage(
                                                plantInfo: {
                                                  'date': dateTaken,
                                                  'name': plantValue.name,
                                                  'id': plantValue.id,
                                                  'imageLink': plantValue.image,
                                                  'guidance':
                                                      plantValue.plantGuidance
                                                },
                                              )));
                                },
                                title: Text("Plant Name: ${plantValue.name}"),
                                subtitle: Text("${plantValue.id}"),
                                leading: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(plantValue.image),
                                    ),
                                  ),
                                ),
                              ),
                            ));

                        // plantInfoPage.dart
                      },
                    ),
                  )
                ],
              ),
            )
          : const Center(child: Text("No plants!")),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            // Navigate to the Add Plant Page
            print("Navigate to the Add Plant Page");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraTab(),
                ));
          },
          color: primaryColor,
        ),
      ),
    );
  }
}

void getPlantInfo() {
  print("Get Plant Info Function called");
}
