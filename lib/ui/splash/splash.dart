import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zeta/constants/colors.dart';
import 'package:zeta/main.dart';
import 'package:zeta/routes.dart';
import 'package:zeta/widgets/app_icon_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
    // navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.light["purpleColor"],
      child: Center(child: AppIconWidget(image: 'assets/icons/ic_appicon.jpg')),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 1000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    // TODO: transfer deze shit naar zermelo service init ofzo
    dynamic accessToken = box.get("access_token");
    dynamic school = box.get("school");
    if (accessToken is String &&
        accessToken.length > 10 &&
        school is String &&
        school.length > 1) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
