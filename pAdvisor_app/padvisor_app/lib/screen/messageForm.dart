import 'package:flutter/material.dart';
import 'hod_or_pa.dart';

class MessageForm extends StatefulWidget {
  @override
  _MessageFormState createState() => _MessageFormState();
}

class _MessageFormState extends State<MessageForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

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
        title: Text('PAdvisor'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              "Message",
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                color: Color(0xfff56476),
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
                      color: Color(0xfff56476),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Select advisor",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.indigoAccent, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Text(
                    "Your message: ",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xfff56476),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    maxLines: 12,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Write your message...",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.greenAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.indigoAccent, width: 1.0),
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
                            MaterialStateProperty.all<Color>(Color(0xfff56476)),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Attach document',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    height: 40,
                    width: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xfff56476)),
                      ),
                      onPressed: () async {
                        await showShareForm(context);
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
