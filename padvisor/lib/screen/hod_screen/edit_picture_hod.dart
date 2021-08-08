import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padvisor/Services/upload_image.dart';

class editPictureHod extends StatefulWidget {
  @override
  _editPictureHodState createState() => _editPictureHodState();
}

class _editPictureHodState extends State<editPictureHod> {
  // variable to store the image
  XFile _Pimage;
  File _image;

  //
  // method to get image from device
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _Pimage = image;
      _image = File(_Pimage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvidsor'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(15),
              child: _image == null
                  ? Image.asset('assets/defaultprofile.png')
                  : Image.file(_image)),
          TextButton(
              onPressed: () {
                uploadFile();
                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt_outlined),
        backgroundColor: Colors.red,
        onPressed: () {
          getImage();
        },
      ),
    );
  }

  //method to upload and update image in firebase storage and firestore
  void uploadFile() async {
    if (_image == null) return;

    final fileName = DateTime.now().toString();
    final destination = 'files/$fileName';
    final uid = FirebaseAuth.instance.currentUser.uid;
    print(uid);

    final uploadTask = UploadImage.uploadFile(destination, _image);
    UploadImage.saveImageUrlToFirebaseHod(uploadTask, uid);
  }
}
