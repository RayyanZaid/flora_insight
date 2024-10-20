import 'package:flutter/material.dart';

class HealthAnalysisPage extends StatefulWidget {
  final String? imagePath;

  const HealthAnalysisPage({Key? key, required this.imagePath});

  @override
  HealthAnalysisPageState createState() => HealthAnalysisPageState();
}

class HealthAnalysisPageState extends State<HealthAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Analysis'),
      ),
      body: Center(
        child: Text('This is the Health Analysis page'),
      ),
    );
  }
}
