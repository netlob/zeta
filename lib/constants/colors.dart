import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = const <int, Color>{
    50: const Color(0xFFFCF2E7),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFFEEB274),
    400: const Color(0xFFEAA256),
    500: const Color(0xFFE69138),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };

  static final light = {
    "background": Color.fromRGBO(243, 244, 249, 1),
    "backgroundAccent":
        Color.fromRGBO(99, 145, 255, 1), //Color.fromRGBO(90, 109, 246, 1),
    "homeworkBackground": Colors.white,
    "homeworkTitle": Color.fromRGBO(90, 89, 103, 1),
    "homeworkButton": Color.fromRGBO(243, 242, 248, 1),
    "appointmentBackground": Colors.white,
    "appointmentTitle": Color.fromRGBO(90, 89, 103, 1),
    "appointmentAbr": Colors.black26,
    "appointmentDate": Color.fromRGBO(85, 85, 106, 1),
    "purpleColor": Color.fromRGBO(110, 33, 209, 1),
  };

  static final dark = {
    "background": Color.fromRGBO(5, 6, 15, 1),
    "backgroundAccent": Color.fromRGBO(90, 109, 246, 1),
    "homeworkBackground": Colors.black87,
    "homeworkTitle": Color.fromRGBO(240, 239, 253, 1),
    "homeworkButton": Colors.black87,
    "appointmentBackground": Color.fromRGBO(8, 11, 24, 1),
    "appointmentTitle": Color.fromRGBO(240, 239, 253, 1),
    "appointmentAbr": Colors.white60,
    "appointmentDate": Color.fromRGBO(185, 185, 206, 1),
    "purpleColor": Color.fromRGBO(110, 33, 209, 1),
  };
}
