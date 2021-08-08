import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:padvisor/screen/course.dart';
import 'package:padvisor/screen/edit_profile.dart';
import 'package:padvisor/screen/hodorpa.dart';
import 'package:padvisor/screen/login_pa.dart';
import 'package:padvisor/screen/setting_pa.dart';
import 'package:provider/provider.dart';
import 'Services/auth_pa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: hodorpa());

    //loginpa());
  }
}
