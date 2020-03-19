import 'package:flutter/material.dart';
import 'package:zeta/utils/theme.dart';
import 'package:zeta/zermelo/Zermelo.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  String school = "stijnvanderkolk";
  String code = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.themes[AppColors.theme]['backgroundAccent'],
      color: Colors.transparent,
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 17))),
                  SizedBox(height: 20),
                  TextFormField(
                    cursorColor: Colors.blue,
                    style: TextStyle(
                      color: Colors.blue,
                      decorationColor: Colors.blue,
                      backgroundColor: Colors.transparent,
                    ),
                    decoration: const InputDecoration(
                        fillColor: Colors.blue,
                        focusColor: Colors.blue,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'School',
                        labelStyle: TextStyle(color: Colors.blue)),
                    validator: (val) => val.isEmpty || val.indexOf(".") > 1
                        ? "Vul een school in (zonder .zportal.nl)"
                        : null,
                    onChanged: (val) => setState(() => school = val),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: false,
                    validator: (val) => val.length != 12
                        ? 'Vul een code in (zonder spaties)'
                        : null,
                    onChanged: (val) => setState(() => code = val),
                    cursorColor: Colors.blue,
                    style: TextStyle(
                      color: AppColors.themes[AppColors.theme]["homeworkTitle"],
                      decorationColor: Colors.blue,
                      backgroundColor: Colors.transparent,
                    ),
                    decoration: const InputDecoration(
                        fillColor: Colors.blue,
                        focusColor: Colors.blue,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Koppel code',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: RaisedButton(
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic accessToken =
                              await Zermelo.getAccessToken(school, code);
                          print(accessToken.toString());
                          zermelo = Zermelo.getAPI(school, accessToken);
                          final userInfo = await zermelo.users.get(id: "~me");
                          print(userInfo.toString());
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  title: Text("Inlog success"),
                                  content: Text(userInfo.toString()),
                                );
                              });

                          // dynamic result = await _auth
                          //     .signInWithEmailAndPassword(
                          //         email, password);
                          // print(result.toString());
                          // if (result == null) {
                          //   setState(() =>
                          //       error = 'Onjuiste inloggegevens');
                          // }
                        }
                      },
                      child: Text(
                        'Inloggen',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
