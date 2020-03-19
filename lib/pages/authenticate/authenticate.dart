import 'package:flutter/material.dart';
import 'package:zeta/pages/authenticate/login.dart';
import 'package:zeta/utils/theme.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zeta',
        home: Container(
            color: AppColors.themes[AppColors.theme]["backgroundAccent"],
            child: SafeArea(
                bottom: false,
                child: Scaffold(
                    body: Container(
                        child: Column(children: <Widget>[LoginView()]))))));
  }
}
