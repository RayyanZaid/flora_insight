import 'package:flutter/material.dart';
import 'constants.dart';

class MyPlantPage extends StatefulWidget {
  @override
  _MyPlantPageState createState() => _MyPlantPageState();
}

class _MyPlantPageState extends State<MyPlantPage> {
  // create a map called plantsInfo
  Map<String, int> plantsInfo = {
    "Aloe Vera": 1,
    "Spider Plant": 2,
    "Snake Plant": 3,
    "Peace Lily": 4,
    "Rubber Plant": 5,
    "Pothos": 6,
    "Bamboo Palm": 7,
    "Fiddle Leaf Fig": 8,
    "Boston Fern": 9,
    "Areca Palm": 10,
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
                        return ListTile(
                            title: Text(plantsInfo.keys.elementAt(index)),
                            subtitle: Text(
                              plantsInfo.values.elementAt(index).toString(),
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