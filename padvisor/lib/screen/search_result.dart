import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'search_new.dart';

class SearchResults extends StatelessWidget {
  final QuerySnapshot qs;

  SearchResults({this.qs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Container(
              width: 380,
              height: 90,
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              child: Card(
                elevation: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.people_outline_outlined,
                        size: 50,
                      ),
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          qs.docs.first.get('name'),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      subtitle: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          qs.docs.first.get('MatricNo'),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
