import 'package:flutter/material.dart';
import 'package:watering_flutter_app/plantInfoPage.dart';
import 'constants.dart';

class MyPlantPage extends StatefulWidget {
  @override
  _MyPlantPageState createState() => _MyPlantPageState();
}

class _MyPlantPageState extends State<MyPlantPage> {
  // create a map called plantsInfo
  Map<String, Map<String, dynamic>> plantsInfo = {
  "2024-10-01": {
    "name": "Aloe Vera",
    "id": 1,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-02": {
    "name": "Spider Plant",
    "id": 2,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-03": {
    "name": "Snake Plant",
    "id": 3,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-04": {
    "name": "Peace Lily",
    "id": 4,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-05": {
    "name": "Rubber Plant",
    "id": 5,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-06": {
    "name": "Pothos",
    "id": 6,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-07": {
    "name": "Bamboo Palm",
    "id": 7,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-08": {
    "name": "Fiddle Leaf Fig",
    "id": 8,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-09": {
    "name": "Boston Fern",
    "id": 9,
    "image": "https://via.placeholder.com/150"
  },
  "2024-10-10": {
    "name": "Areca Palm",
    "id": 10,
    "image": "https://via.placeholder.com/150"
  },
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
          title: Text('My Plants'),
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
                        Map<String,dynamic> plantInfoValue = plantsInfo.values.elementAt(index);
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
                                                  'name' : ,
                                                  'id' : ,
                                                  'imageLink' : ,
                                                },
                                              )));
                                },
                                title: Text(
                                    "Plant Name: ${plantsInfo.keys.elementAt(index)}"),
                                subtitle: Text(
                                    "${plantsInfo.values.elementAt(index)}"),
                                leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        " https://via.placeholder.com/150")),
                              ),
                            ));

                        // plantInfoPage.dart
                      },
                    ),
                  )
                ],
              ),
            )
          : Center(child: Text("No plants!")),
    );
  }
}

void getPlantInfo() {
  print("Get Plant Info Function called");
}
