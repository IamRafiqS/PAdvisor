import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:padvisor/Services/auth_student.dart';
import 'package:padvisor/Services/database.dart';

class writeMessage extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String id = FirebaseAuth.instance.currentUser.uid;
  final AuthStudentService _auth = AuthStudentService();

  CollectionReference docStudentRef =
      FirebaseFirestore.instance.collection("StudentData");
  CollectionReference docPARef =
      FirebaseFirestore.instance.collection("paData");
  CollectionReference docHODRef =
      FirebaseFirestore.instance.collection("hodData");

  final _controllerRecipient = TextEditingController();
  final _controllerMessage = TextEditingController();

  String recipientEmail;
  String recipientCategory = '';
  String recipientID;

  String senderEmail;
  String senderCategory = '';
  String messageContent;

  void setVariable() {
    recipientEmail = _controllerRecipient.text;
    messageContent = _controllerMessage.text;

    getSenderCategory('StudentData');
    getRecipientCategory('StudentData');
  }

  void getSenderCategory(String collection) {
    bool nextPA = false;
    bool nextHOD = false;
    if (collection == 'StudentData') {
      nextPA = true;
    }
    if (collection == 'paData') {
      nextHOD = true;
    }

    FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        FirebaseFirestore.instance
            .collection(collection)
            .doc(id)
            .get()
            .then((value) {
          senderCategory = collection;
          senderEmail = value['email'];
        });
      } else {
        if (nextPA == true) {
          getSenderCategory('paData');
        } else if (nextHOD == true) {
          getSenderCategory('hodData');
          print('Document not exists');
        } else {
          print('Document not exists');
        }
      }
    });
  }

  void getRecipientCategory(String collection) {
    bool isFound = false;
    bool nextPA = false;
    bool nextHOD = false;
    if (collection == 'StudentData') {
      nextPA = true;
    }
    if (collection == 'paData') {
      nextHOD = true;
    }

    FirebaseFirestore.instance
        .collection(collection)
        .get()
        .then((querysnapshot) {
      querysnapshot.docs.forEach((value) {
        if (recipientEmail == value['email']) {
          isFound = true;
          recipientCategory = collection;
          recipientID = value.id;
        }
      });
      if (isFound == false) {
        if (nextPA == true) {
          getRecipientCategory('paData');
        } else if (nextHOD == true) {
          getRecipientCategory('hodData');
        }
      }
    });
  }

  Future<void> showShareForm(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isWhatsapp = false;
          bool isWeChat = false;
          bool isEmail = false;
          bool isDirect = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Share to',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Whatsapp'),
                      secondary: Image.asset(
                        'assets/whatsapp.png',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      value: isWhatsapp,
                      onChanged: (checked) {
                        setState(() {
                          isWhatsapp = checked;
                        });
                      },
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('WeChat'),
                      secondary: Image.asset(
                        'assets/wechat.png',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      value: isWeChat,
                      onChanged: (checked) {
                        setState(() {
                          isWeChat = checked;
                        });
                      },
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Email'),
                      secondary: Image.asset(
                        'assets/email.png',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      value: isEmail,
                      onChanged: (checked) {
                        setState(() {
                          isEmail = checked;
                        });
                      },
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Direct message'),
                      secondary: Image.asset(
                        'assets/direct.png',
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      value: isDirect,
                      onChanged: (checked) {
                        setState(() {
                          isDirect = checked;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Share'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (isDirect == true) {
                        setVariable();
                        // DatabaseServices(uid: id).sentMessage(senderEmail, senderCategory, recipientEmail, recipientCategory, messageContent);
                      }
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAdvisor'),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              "Message",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 32.0),
                  Text(
                    "To: ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _controllerRecipient,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Select advisor",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    "Your message: ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: _controllerMessage,
                    maxLines: 12,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Write your message...",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 32.0),
                  Container(
                    height: 40,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () async {
                        // await showShareForm(context);
                        setVariable();
                        DatabaseServices(uid: id).sentMessage(
                            senderEmail,
                            senderCategory,
                            recipientEmail,
                            recipientCategory,
                            recipientID,
                            messageContent);
                        //   Navigator.pop(
                        //   context,
                        // );
                      },
                      child: Text(
                        'Share message',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
