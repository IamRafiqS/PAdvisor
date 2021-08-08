import 'package:flutter/material.dart';
import 'package:padvisor_app/screen/addNotice.dart';
import 'package:padvisor_app/screen/advisorList.dart';
import 'package:padvisor_app/screen/adviseeList.dart';
import 'package:padvisor_app/screen/archive.dart';
import 'package:padvisor_app/screen/editProfile.dart';
import 'package:padvisor_app/screen/hod_or_pa.dart';
import 'package:padvisor_app/screen/intro.dart';
import 'package:padvisor_app/screen/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: Color.fromRGBO(125, 130, 184, .1),
    100: Color.fromRGBO(125, 130, 184, .2),
    200: Color.fromRGBO(125, 130, 184, .3),
    300: Color.fromRGBO(125, 130, 184, .4),
    400: Color.fromRGBO(125, 130, 184, .5),
    500: Color.fromRGBO(125, 130, 184, .6),
    600: Color.fromRGBO(125, 130, 184, .7),
    700: Color.fromRGBO(125, 130, 184, .8),
    800: Color.fromRGBO(125, 130, 184, .9),
    900: Color.fromRGBO(125, 130, 184, 1),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF7D82B8, color),
        ),
        home: intro()
        //ConfirmationStaff()
        //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
