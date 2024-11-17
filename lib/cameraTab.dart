// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'healthAnalysisPage.dart';
import 'imageButton.dart';
import 'constants.dart';

class CameraTab extends StatefulWidget {
  const CameraTab({super.key});

  @override
  CameraTabState createState() => CameraTabState();
}

class CameraTabState extends State<CameraTab> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; //sate Variable

  Future<void> takePicture() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor.withOpacity(0.05),
        appBar: AppBar(
          title: const Text("Camera"),
          backgroundColor: primaryColor,
        ),
        body: _imageFile == null
            ? Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "take a picture to Analyze",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ImageButton(
                      icon: Icons.camera_alt,
                      onPressed: takePicture,
                      label: 'Take Picture')
                ],
              )
            : Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      InkWell(child: Image.file(File(_imageFile!.path))),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HealthAnalysisPage(
                                        imagePath: _imageFile!.path,
                                      )),
                            );
                          },
                          child: Text('Health Analysis'))
                    ],
                  ),
                )));
  }
}
