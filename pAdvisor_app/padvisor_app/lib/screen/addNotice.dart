import 'package:flutter/material.dart';
import 'hod_or_pa.dart';

class addNotice extends StatefulWidget {
  //const addNotice({ Key? key }) : super(key: key);

  @override
  _addNoticeState createState() => _addNoticeState();
}

class _addNoticeState extends State<addNotice> {
  String dropdownValue = 'All';

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConfirmationStaff()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'PAdvisor',
            style: TextStyle(fontFamily: 'InknutAntiqua'),
          ),
          actions: [
            PopupMenuButton<int>(
                onSelected: (item) => onSelected(context, item),
                icon: Icon(Icons.menu),
                itemBuilder: (context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Color(0xfff56476),
                          ),
                        ),
                      ),
                    ]),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Add Notice',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfff56476),
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'InknutAntiqua',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20),
              child: Text(
                'To:. ',
                style: TextStyle(
                    color: Colors.red[400], fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: DropdownButton(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  isExpanded: true,
                  elevation: 16,
                  style: const TextStyle(color: Color(0xfff56476)),
                  underline: Container(
                    height: 2,
                    color: Color(0xfff56476),
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['All', 'Lecturers Only', 'Students Only']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20, top: 20),
              child: Text(
                'Your Message:.',
                style: TextStyle(
                    color: Color(0xfff56476), fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                  maxLines: 12,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write your message.',
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              //alignment: Alignment.center,
              margin: EdgeInsets.only(left: 120),
              width: 140,
              height: 30,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: Color(0xfff56476),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Attach Document',
                            style: TextStyle(color: Colors.white),
                          )))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              //alignment: Alignment.center,
              margin: EdgeInsets.only(left: 120),
              width: 140,
              height: 30,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      color: Color(0xfff56476),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Share Message',
                            style: TextStyle(color: Colors.white),
                          )))),
            )
          ],
        ));
  }
}
