import 'package:album_app/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard.dart';
import 'package:album_app/provider/theme_provider.dart';
import 'package:album_app/Widget/change_theme_button_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            //themeMode: ThemeMode.system,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: MyHomePage(title: 'Photo Album App'),
          );
        },
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final localAuth = LocalAuthentication();

//check wether the device has biometric
  static Future<bool> hasBiometrics() async {
    try {
      return await localAuth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

//authenticate the fingerprint
  static Future<bool> authenticateFingerprint() async {
    final isAvailable = await hasBiometrics();

    if (!isAvailable) return false;

    try {
      return await localAuth.authenticate(
          localizedReason: 'Scan fingerprint to access album.',
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
        actions: [
          //IconButton(icon: Icon(Icons.brightness_2_rounded), onPressed: () {})
          ChangeThemeButtonWidget()
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Authenticate by using your fingerprint"),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            FloatingActionButton(
              onPressed: () async {
                //final isAuthenticated = await authenticateFingerprint();
                bool isAuthenticated = await localAuth.canCheckBiometrics;

                if (isAuthenticated) {
                  bool authenticated = await localAuth.authenticate(
                    biometricOnly: true,
                    localizedReason: 'Authenticate to access the album.',
                    useErrorDialogs: true,
                    stickyAuth: true,
                  );
                  print(authenticated);

                  if (authenticated) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => dashboard()));
                  }
                } else
                  print('error');
              },
              child: Icon(
                Icons.fingerprint_sharp,
              ),
            ),
            SizedBox(
              height: 10,
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
