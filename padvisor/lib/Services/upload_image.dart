import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadImage {
  static UploadTask uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref;
      print('Uploaded Image');
      return ref().child(destination).putFile(file);
      //
    } on FirebaseException catch (e) {
      return null;
    }
  }

  //save image to fireabase PA
  static saveImageUrlToFirebasePa(UploadTask task, String uid) {
    //
    print("save Image Url to Firebase is working");
    task.snapshotEvents.listen((TaskSnapshot snapShot) {
      if (snapShot.state == TaskState.success) {
        snapShot.ref.getDownloadURL().then((imageUrl) => {
              print('URL succeed: ' + imageUrl),
              //set imageUrl received into image field in the doc
              updateImageinFirestorePa(imageUrl, uid)
            });
      } else
        print('url fail');
    });
  }

  // Update in Firestore PA
  static updateImageinFirestorePa(String path, String uid) {
    FirebaseFirestore.instance
        .collection('paData')
        .doc(uid)
        .update({'image': path});
  }

  //save image to fireabase Student
  static saveImageUrlToFirebaseStudent(UploadTask task, String uid) {
    //
    print("save Image Url to Firebase is working");
    task.snapshotEvents.listen((TaskSnapshot snapShot) {
      if (snapShot.state == TaskState.success) {
        snapShot.ref.getDownloadURL().then((imageUrl) => {
              print('URL succeed: ' + imageUrl),
              //set imageUrl received into image field in the doc
              updateImageinFirestoreStudent(imageUrl, uid)
            });
      } else
        print('url fail');
    });
  }

  // Update in firestore Student
  static updateImageinFirestoreStudent(String path, String uid) {
    FirebaseFirestore.instance
        .collection('StudentData')
        .doc(uid)
        .update({'image': path});
  }

  //save image to fireabase Hod
  static saveImageUrlToFirebaseHod(UploadTask task, String uid) {
    //
    print("save Image Url to Firebase is working");
    task.snapshotEvents.listen((TaskSnapshot snapShot) {
      if (snapShot.state == TaskState.success) {
        snapShot.ref.getDownloadURL().then((imageUrl) => {
              print('URL succeed: ' + imageUrl),
              //set imageUrl received into image field in the doc
              updateImageinFirestoreHod(imageUrl, uid)
            });
      } else
        print('url fail');
    });
  }

  // Update in firestore Hod
  static updateImageinFirestoreHod(String path, String uid) {
    FirebaseFirestore.instance
        .collection('hodData')
        .doc(uid)
        .update({'image': path});
  }
}
