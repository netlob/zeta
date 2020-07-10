import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  fontFamily: "Nunito",
  primaryColor: Color.fromRGBO(90, 109, 246, 1),
  accentColor: Color.fromRGBO(90, 109, 246, 1),
  canvasColor: Color.fromRGBO(90, 109, 246, 1),
  backgroundColor: Color.fromRGBO(90, 109, 246, 1),
  cardColor: Colors.white,
  scaffoldBackgroundColor: Color.fromRGBO(243, 244, 249, 1),
  brightness: Brightness.light,
);

var darkTheme = ThemeData(
  fontFamily: "Nunito",
  primaryColor: Color.fromRGBO(90, 109, 246, 1),
  accentColor: Color.fromRGBO(90, 109, 246, 1),
  canvasColor: Color.fromRGBO(90, 109, 246, 1),
  backgroundColor: Color.fromRGBO(90, 109, 246, 1),
  cardColor: Colors.black87,
  scaffoldBackgroundColor: Colors.black87,
  brightness: Brightness.dark,
);

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeChanger();

  getTheme() => _themeData;

  setTheme(String theme) {
    if (theme == "dark")
      _themeData = darkTheme;
    else
      _themeData = lightTheme;

    notifyListeners();
  }
}

class AppColors {
  static var theme = "light";
  static final themes = {
    "light": {
      "background": Color.fromRGBO(243, 244, 249, 1),
      "backgroundAccent":
          Color.fromRGBO(99, 145, 255, 1), //Color.fromRGBO(90, 109, 246, 1),
      "homeworkBackground": Colors.white,
      "homeworkTitle": Color.fromRGBO(90, 89, 103, 1),
      "homeworkButton": Color.fromRGBO(243, 242, 248, 1),
      "appointmentBackground": Colors.white,
      "appointmentTitle": Color.fromRGBO(90, 89, 103, 1),
      "appointmentAbr": Colors.black26,
      "appointmentDate": Color.fromRGBO(85, 85, 106, 1)
    },
    "dark": {
      "background": Color.fromRGBO(5, 6, 15, 1),
      "backgroundAccent": Color.fromRGBO(90, 109, 246, 1),
      "homeworkBackground": Colors.black87,
      "homeworkTitle": Color.fromRGBO(240, 239, 253, 1),
      "homeworkButton": Colors.black87,
      "appointmentBackground": Color.fromRGBO(8, 11, 24, 1),
      "appointmentTitle": Color.fromRGBO(240, 239, 253, 1),
      "appointmentAbr": Colors.white60,
      "appointmentDate": Color.fromRGBO(185, 185, 206, 1)
    }
  };
}
