import 'package:flutter/material.dart';

class settingPa extends StatefulWidget {
  @override
  _settingPaState createState() => _settingPaState();
}

class _settingPaState extends State<settingPa> {
  String dropdownValue = '19/20';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'PAdvisor',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Settings',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          dropDown(),
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text('Archive'),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
            ),
          ),
        ],
      ),
    );
  }

  Widget dropDown() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Choose Cohort to archive: ',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 17),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            isExpanded: true,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            underline: Container(
              height: 2,
              color: Colors.redAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['19/20', '20/21', '21/22', '22/23']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
