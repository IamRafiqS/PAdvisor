import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.orange.shade400, opacity: 0.8),
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue[400]),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(backgroundColor: Colors.blue[400])),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.blue.shade400),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: Colors.black54, opacity: 0.8),
      buttonTheme: ButtonThemeData(buttonColor: Colors.green),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: Colors.green)),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.green));
}
