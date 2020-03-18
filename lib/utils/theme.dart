import 'package:flutter/material.dart';

class AppColors {
  static var theme = "light";
  static final themes = {
    "light": {
      "background": Color.fromRGBO(243, 244, 249, 1),
      "backgroundAccent": Color.fromRGBO(90, 109, 246, 1),
      "homeworkBackground": Colors.white,
      "homeworkTitle": Color.fromRGBO(90, 89, 103, 1),
      "homeworkButton": Color.fromRGBO(243, 242, 248, 1),
      "appointmentBackground": Colors.white,
      "appointmentTitle": Color.fromRGBO(90, 89, 103, 1),
      "appointmentAbr": Colors.black26,
      "appointmentDate": Color.fromRGBO(85, 85, 106, 1)
    },
    "dark": {
      "background": Colors.black87,
      "backgroundAccent": Color.fromRGBO(90, 109, 246, 1),
      "homeworkBackground": Colors.black87,
      "homeworkTitle": Color.fromRGBO(240, 239, 253, 1),
      "homeworkButton": Colors.black87,
      "appointmentBackground": Colors.black26,
      "appointmentTitle": Color.fromRGBO(240, 239, 253, 1),
      "appointmentAbr": Colors.white60,
      "appointmentDate": Color.fromRGBO(185, 185, 206, 1)
    }
  };
}
