import 'package:flutter/material.dart';
import 'package:zeta/pages/home/home.dart';
import 'package:zeta/zermelo/Zermelo.dart';
import 'package:hive/hive.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final box = Hive.box('zetaBox');

  String school = "";
  String code = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            key: _formKey,
            child: Stack(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ZETA",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(height: 80),
                        // MediaQuery.of(context).copyWith().size.height / 4.5),
                        Center(
                            child: Text("Welkom\nterug!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2))),
                        // SizedBox(height: 20),
                        Container(
                            height: 100,
                            child: Row(children: <Widget>[
                              // Text("https://",
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         decorationColor: Colors.white,
                              //         backgroundColor: Colors.transparent,
                              //         fontSize: 20)),
                              // SizedBox(width: 10),
                              Flexible(
                                  child: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white,
                                    decorationColor: Colors.white,
                                    backgroundColor: Colors.transparent,
                                    fontSize: 20),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white60),
                                    ),
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    labelText: 'School',
                                    labelStyle: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                validator: (val) => val.isEmpty ||
                                        val.indexOf(".") > 1
                                    ? "Vul een school in (zonder .zportal.nl)"
                                    : null,
                                onChanged: (val) =>
                                    setState(() => school = val),
                              )),
                              SizedBox(width: 10),
                              Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Text(".zportal.nl",
                                      style: TextStyle(
                                          color: Colors.white,
                                          decorationColor: Colors.white,
                                          backgroundColor: Colors.transparent,
                                          fontSize: 20)))
                            ])),
                        Stack(overflow: Overflow.visible, children: <Widget>[
                          Container(
                              height: 100,
                              child: TextFormField(
                                obscureText: false,
                                validator: (val) =>
                                    val.length != 12 && val.length != 15
                                        ? 'Vul een koppelcode in'
                                        : null,
                                onChanged: (val) => setState(() => code = val),
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white,
                                    decorationColor: Colors.white,
                                    backgroundColor: Colors.transparent,
                                    fontSize: 20),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white60),
                                    ),
                                    fillColor: Colors.white,
                                    focusColor: Colors.white,
                                    labelText: 'Koppel code',
                                    labelStyle: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              )),
                          // SizedBox(height: 10),
                          Positioned(
                              top: 70,
                              right: -15,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: FlatButton(
                                      onPressed: () {},
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      textColor: Colors.black,
                                      child: Text(
                                        "QR code scannen?",
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w200),
                                      ))))
                        ])
                      ])),
              Positioned(
                  left: 30,
                  bottom: 30,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 80,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Color.fromRGBO(227, 97, 145, 1),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              dynamic accessToken =
                                  await Zermelo.getAccessToken(school, code);
                              if (accessToken is Exception) {
                                if (accessToken.toString().contains('404')) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Oeps!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        )),
                                      content: Text('De school is niet geldig. Typefout?'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Doorgaan"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                                  return;
                                } else if (accessToken.toString().contains('400')) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Oeps!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        )),
                                      content: Text('De koppelcode is niet geldig.'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Doorgaan"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });                                  return;
                                } else {
                                  showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Oeps!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        )),
                                      content: Text('Er is iets mis gegaan..'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Doorgaan"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });           
                                  return;
                                }
                              }
                              zermelo = Zermelo.getAPI(school, accessToken);
                              if (accessToken is Exception)
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Oeps!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        )),
                                      content: Text('Er is iets mis gegaan..'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Doorgaan"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                              final userInfo =
                                  await zermelo.users.get(id: "~me");
                              if (userInfo is Exception) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Oeps!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        )),
                                      content: Text('Er is iets mis gegaan..'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Doorgaan"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  });
                                return;
                              }
                              box.put('accessToken', accessToken);
                              box.put('school', school);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                    HomeView(),
                                  fullscreenDialog: true));
                            }
                          },
                          child: Text(
                            'Inloggen',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )))
            ])));
  }
}
