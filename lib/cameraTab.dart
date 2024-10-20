import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watering_flutter_app/healthAnalysisPage.dart';
import 'package:watering_flutter_app/imageButton.dart';
import 'constants.dart';

class CameraTab extends StatefulWidget {
  @override
  CameraTabState createState() => CameraTabState();
}

class CameraTabState extends State<CameraTab> {
  // Variables for the camera
  final ImagePicker _picker = ImagePicker();

  // State Variable (it can change)
  XFile? _imageFile;

  Future<void> takePicture() async {
    var pickedImage = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _imageFile = pickedImage;
    });
  }

// if the image is null, then show a Text that says "Select an image"
// if the image exists, then show a Text that says "Image Selected"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor.withOpacity(0.05),
        appBar: AppBar(title: const Text("Camera")),
        body: _imageFile == null
            ? Column(
                // ignore: sort_child_properties_last
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Take a Picture to Analyze",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 30),
                  ImageButton(
                      icon: Icons.camera_alt,
                      onPressed: takePicture,
                      label: 'Take Picture')
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
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
