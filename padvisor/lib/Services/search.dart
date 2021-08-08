import 'package:cloud_firestore/cloud_firestore.dart';

class SearchServices {
  Future searchByName(String searchField) async {
    return await FirebaseFirestore.instance
        .collection('StudentData')
        .where('MatricNo', isEqualTo: searchField)
        .get();
  }
}
