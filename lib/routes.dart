import 'package:flutter/material.dart';
import 'package:zeta/ui/home/home.dart';
import 'package:zeta/ui/login/login.dart';
import 'package:zeta/ui/settings/settings.dart';
import 'package:zeta/ui/splash/splash.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String settings = '/settings';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeView(),
    settings: (BuildContext context) => SettingsView(),
  };
}
