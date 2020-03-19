import 'package:flutter/material.dart';
import 'package:zeta/utils/theme.dart';
import 'package:zeta/zermelo/Zermelo.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  String school = "";
  String code = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themes[AppColors.theme]['backgroundAccent'],
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
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'School',
                        labelStyle: TextStyle(color: Colors.white)),
                    validator: (val) =>
                        val.isEmpty ? "Vul een school in" : null,
                    onChanged: (val) => setState(() => school = val),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val.length < 6 ? 'Vul een wachtwoord in' : null,
                    onChanged: (val) => setState(() => code = val),
                    cursorColor: Colors.white,
                    style: TextStyle(
                      color: Colors.white,
                      decorationColor: Colors.white,
                      backgroundColor: Colors.transparent,
                    ),
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: const OutlineInputBorder(),
                        labelText: 'Koppel code',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    child: RaisedButton(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic accessToken = await Zermelo.getAccessToken(
                              "stijnvanderkolk", "537934396908");
                          print(accessToken.toString());
                          final zermeloAPI =
                              Zermelo.getAPI("stijnvanderkolk", accessToken);
                          final userInfo =
                              await zermeloAPI.users.get(id: "~me");
                          print(userInfo.toString());

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
                            color: Colors.black87,
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
