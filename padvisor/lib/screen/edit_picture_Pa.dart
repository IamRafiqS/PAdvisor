import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:padvisor/Services/upload_image.dart';

class editPicture extends StatefulWidget {
  @override
  _editPictureState createState() => _editPictureState();
}

class _editPictureState extends State<editPicture> {
  XFile _Pimage;
  File _image;

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

  void uploadFile() async {
    if (_image == null) return;

    final fileName = DateTime.now().toString();
    final destination = 'files/$fileName';
    final uid = FirebaseAuth.instance.currentUser.uid;
    print(uid);

    final uploadTask = UploadImage.uploadFile(destination, _image);
    UploadImage.saveImageUrlToFirebasePa(uploadTask, uid);
  }
}
