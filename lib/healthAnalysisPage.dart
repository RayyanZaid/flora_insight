import 'package:flutter/material.dart';
import 'constants.dart';

class HealthAnalysisPage extends StatefulWidget {
  final String? imagePath;
  const HealthAnalysisPage({Key? Key, required this.imagePath});

  @override
  HealthAnalysisPageState createState() => HealthAnalysisPageState();
}

class HealthAnalysisPageState extends State<HealthAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Analysis'),
        backgroundColor: primaryColor,
      ),
      body: const Center(
        child: Text('This is the Health Analysis page'),
      ),
    );
  }
}
