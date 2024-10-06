import 'package:flutter/material.dart';

class PlantSearchPage extends StatefulWidget {
  @override
  PlantSearchPageState createState() => PlantSearchPageState();
}

class PlantSearchPageState extends State<PlantSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
      ),
      body: Center(
        child: Text('This is the Articles page'),
      ),
    );
  }
}
