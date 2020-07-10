import 'package:flutter/material.dart';
import 'package:zeta/pages/authenticate/login.dart';

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
        theme: ThemeData(fontFamily: "Nunito"),
        home: Stack(children: <Widget>[
          Center(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/login_purple.jpg'),
              fit: BoxFit.cover,
            )),
          )),
          Container(
              child: SafeArea(
                  bottom: true,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Scaffold(
                        resizeToAvoidBottomPadding: false,
                        backgroundColor: Colors.transparent,
                        body: LoginView());
                  })))
        ]));
  }
}
