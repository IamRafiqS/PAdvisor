import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class camera extends StatefulWidget {
  @override
  _cameraState createState() => _cameraState();
}

class _cameraState extends State<camera> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  File _image;
  List<UploadTask> uploadedTask = List();
  List<File> selectedFile = List();
  var description;
  var date;
  var folder;
  DateTime now;
  UploadTask task1;
  var location;

  Future getImageCamera() async {
    selectedFile.clear();

    final _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.camera);
    _image = File(image.path);
    selectedFile.add(_image);
    addData(descData.text, folderData.text);
    final UploadTask task = uploadFiletoStorage(_image);
    saveImageUrlToFirebase(task);

    setState(() {
      _image = File(image.path);
      task1 = task;
      uploadedTask.add(task);
    });
  }

  Future getImageGallery() async {
    selectedFile.clear();

    final _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.gallery);
    _image = File(image.path);
    selectedFile.add(_image);
    addData(descData.text, folderData.text);
    final UploadTask task = uploadFiletoStorage(_image);
    saveImageUrlToFirebase(task);

    setState(() {
      _image = File(image.path);
      task1 = task;
      uploadedTask.add(task);
    });
  }

  uploadFiletoStorage(File file) {
    UploadTask task = _firebaseStorage
        .ref()
        .child("$folder/${DateTime.now().toString()}")
        .putFile(file);

    return task;
  }

//write Image to firestore
  writeImageToFirestore(imageUrl) {
    print("write Image to Firestore working");
    _firebaseFirestore.collection("$folder").add({
      "url": imageUrl,
      "desc": description,
      "date": date,
      "Location": location
    }).whenComplete(() => print("$imageUrl is saved in Firestore."));
  }

//save image to fireabase
  saveImageUrlToFirebase(UploadTask task) {
    print("save Image Url to Firebase is working");
    task.snapshotEvents.listen((TaskSnapshot snapShot) {
      if (snapShot.state == TaskState.success) {
        snapShot.ref
            .getDownloadURL()
            .then((imageUrl) => writeImageToFirestore(imageUrl));
      } else
        print('url fail');
    });
  }

  addData(String desc, String folderTaken) {
    setState(() {
      now = DateTime.now();
      description = desc;
      folder = folderTaken;
      date = "${now.hour}:${now.minute} - ${now.day}/${now.month}/${now.year}";
    });
  }

  getLocation() async {
    Position currLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(currLocation);

    setState(() {
      location = "Lat:${currLocation.latitude}, Long:${currLocation.longitude}";
    });
  }

  TextEditingController descData = new TextEditingController();
  TextEditingController folderData = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: descData,
            decoration: InputDecoration(hintText: 'Description'),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: folderData,
            decoration: InputDecoration(hintText: 'Folder'),
          ),
          SizedBox(
            height: 500,
            width: 400,
            child: Center(
                child: _image == null
                    ? Text("Image is not loaded")
                    : Image.file(_image)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: "btnCam",
                  onPressed: getImageCamera,
                  child: Icon(Icons.camera_alt),
                ),
                FloatingActionButton(
                  heroTag: "btnCheck",
                  onPressed: () {
                    //addData(descData.text, folderData.text);
                    //saveImageUrlToFirebase(task1);
                    print(task1.toString());
                    Navigator.pop(context, (_image.path).toString());
                    //addData(descData.text, dateData.text);
                  },
                  child: Icon(Icons.check_rounded),
                ),
                FloatingActionButton(
                  heroTag: "btnLocation",
                  onPressed: getLocation,
                  child: Icon(Icons.location_on_outlined),
                ),
                FloatingActionButton(
                  heroTag: "btnGallery",
                  onPressed: getImageGallery,
                  child: Icon(Icons.image),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
