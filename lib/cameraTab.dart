import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraTab extends StatefulWidget {
  @override
  CameraTabState createState() => CameraTabState();
}

class CameraTabState extends State<CameraTab> {
  // Variables for the camera
  final ImagePicker _picker = ImagePicker();

  // State Variable (it can change)
  XFile? _imageFile;

  int returnSum(int a, int b) {
    return a + b;
  }

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
        appBar: AppBar(title: Text("Camera")),
        body: _imageFile == null
            ? Column(
                children: [
                  SizedBox(height: 50),
                  Text("Take a Picture to Analyze"),
                  SizedBox(height: 30),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: takePicture,
                  )
                ],
              )
            : Text("Image Selected"));
  }
}
