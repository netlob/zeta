import 'package:zeta/pages/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:flutter/rendering.dart';
import 'package:zeta/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:zeta/utils/wave.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    // final Brightness brightness =
    //     WidgetsBinding.instance.window.platformBrightness;
    //inform listeners and rebuild widget tree
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    debugPrint(AppColors.theme.toString());
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zeta',
        home: Container(
            color: AppColors.themes[AppColors.theme]["backgroundAccent"],
            child: SafeArea(
                bottom: false,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Scaffold(
                    body: Container(
                        color: AppColors.themes[AppColors.theme]["background"],
                        child:
                            // Column(children: [
                            Stack(children: <Widget>[
                          // Stack(children: <Widget>[
                          ClipPath(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.themes[AppColors.theme]
                                        ["backgroundAccent"]),
                                height: 210),
                            clipper: BottomWaveLeft(),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                // IconButton(
                                //     icon: Icon(Icons.search, color: Colors.white),
                                //     onPressed: () {}),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(30, 80, 20, 10),
                              child: Column(children: <Widget>[
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                          // mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Hey Sjoerd",
                                              // "Vandaag",
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text("Klas 5H1 - AH 1823",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white))
                                          ])
                                      // Icon(Icons.arrow_drop_down, color: Colors.white)
                                    ]),
                                SizedBox(height: 135),
                                Divider()
                              ])),
                          Container(
                              margin: EdgeInsets.only(top: 225, left: 50),
                              child: Row(children: <Widget>[
                                FlatButton(
                                  color: AppColors.themes[AppColors.theme]
                                      ["backgroundAccent"],
                                  child: Text("Donkere modus",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  onPressed: () {
                                    Provider.of<ThemeChanger>(context,
                                            listen: false)
                                        .setTheme('dark');
                                    AppColors.theme = "dark";
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FlatButton(
                                    color: AppColors.themes[AppColors.theme]
                                        ["backgroundAccent"],
                                    child: Text("Lichte modus",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    onPressed: () {
                                      Provider.of<ThemeChanger>(context,
                                              listen: false)
                                          .setTheme('light');
                                      AppColors.theme = "light";
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0)))
                              ])),
                          Container(
                              margin: EdgeInsets.only(top: 250),
                              padding: EdgeInsets.all(50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Statussen",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.black54)),
                                  SizedBox(height: 10),
                                  Row(children: <Widget>[
                                    Text("Zermelo:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("deze status werkt niet lo",
                                        style: TextStyle(color: Colors.black54))
                                  ]),
                                  Divider(),
                                  FlatButton.icon(
                                    icon: Icon(Icons.exit_to_app,
                                        color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Authenticate(),
                                            fullscreenDialog: true),
                                      );
                                    },
                                    color: Colors.red[500],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(18.0)),
                                    label: Text(
                                      "Uitloggen",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  )
                                ],
                              )),
                          // ])
                        ])),
                  );
                }))));
  }
}
