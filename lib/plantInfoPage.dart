//import './constants.dart';

import 'package:flutter/material.dart';

class PlantInfoPage extends StatefulWidget {
  final Map plantInfo;

  const PlantInfoPage({Key? key, required this.plantInfo}) : super(key: key);

  @override
  PlantInfoPageState createState() => PlantInfoPageState();
}

class PlantInfoPageState extends State<PlantInfoPage> {
  Map plantInfo = {};
  @override
  void initState() {
    super.initState();
    plantInfo = widget.plantInfo;
  }

  @override
  Widget build(BuildContext context) {
    // Create a display for the name and id.

    // Title
    // ID
    // Image
    return Scaffold(
        appBar: AppBar(title: Text("PlantInfoPage")),
        body: Center(
            child: (Column(
          children: [
            Text("${plantInfo["name"]}"),
            Text("${plantInfo["id"]}"),
            Text("${plantInfo["image"]}"),
            Text("${plantInfo["guidance"]}"),
          ],
        ))));
  }

  // Create the initState method here
  // call super.initState
  // plantInfo = widget's plant info
}
