import 'package:flutter/material.dart';

class folder extends StatefulWidget {
  //const folder({ Key? key }) : super(key: key);

  @override
  _folderState createState() => _folderState();
}

class _folderState extends State<folder> {
  var folder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Folder'),
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Images'),
              leading: Radio(
                value: 'images',
                groupValue: folder,
                onChanged: (value) {
                  setState(() {
                    folder = value;
                    setState(() {});
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Kitchen'),
              leading: Radio(
                value: 'kitchen',
                groupValue: folder,
                onChanged: (value) {
                  setState(() {
                    folder = value;
                    setState(() {});
                  });
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(children: [
                      Positioned.fill(
                          child: Container(
                        decoration: BoxDecoration(color: Colors.blue[400]),
                      )),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(16.0),
                          ),
                          onPressed: () {
                            print(folder);
                            Navigator.pop(context, folder);
                          },
                          child: Text('ok')),
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
