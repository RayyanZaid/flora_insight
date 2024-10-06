// import './constants.dart';

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
    // TODO: implement build
    throw UnimplementedError();
  }

  // Create the initState method here
  // call super.initState
  // plantInfo = widget's plant info
}
