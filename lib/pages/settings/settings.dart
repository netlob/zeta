import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zeta/models/appointment.dart';
//
import 'package:zeta/utils/theme.dart';
import 'package:zeta/utils/wave.dart';

import 'package:zeta/pages/home/components/HomeworkCard.dart';

// import 'package:zeta/splash.dart';
// import 'package:zeta/fadeonscroll.dart';

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
                child: Scaffold(
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
                            child: Row(
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
                                ])),
                        Container(
                            margin: EdgeInsets.only(top: 60),
                            height: 280,
                            child: _buildCarousel(context)),
                        Container(
                            margin: EdgeInsets.only(top: 200),
                            padding: EdgeInsets.all(50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Statussen",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: AppColors.themes[AppColors.theme]
                                            ["homeworkTitle"])),
                                Row(children: <Widget>[
                                  Text("Zermelo:",
                                      style: TextStyle(
                                          color:
                                              AppColors.themes[AppColors.theme]
                                                  ["homeworkTitle"])),
                                  Text("Niet Gekoppeld",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              AppColors.themes[AppColors.theme]
                                                  ["homeworkTitle"]))
                                ]),
                                Row(children: <Widget>[
                                  Text("Appie:",
                                      style: TextStyle(
                                          color:
                                              AppColors.themes[AppColors.theme]
                                                  ["homeworkTitle"])),
                                  Text("WIP",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              AppColors.themes[AppColors.theme]
                                                  ["homeworkTitle"]))
                                ]),
                                Divider(),
                                FlatButton(
                                  color: AppColors.themes[AppColors.theme]
                                      ["backgroundAccent"],
                                  child: Text(
                                    "Dark mode",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Provider.of<ThemeChanger>(context,
                                            listen: false)
                                        .setTheme('dark');
                                    AppColors.theme = "dark";
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                ),
                                FlatButton(
                                  color: AppColors.themes[AppColors.theme]
                                      ["backgroundAccent"],
                                  child: Text(
                                    "Light mode",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  onPressed: () {
                                    Provider.of<ThemeChanger>(context,
                                            listen: false)
                                        .setTheme('light');
                                    AppColors.theme = "light";
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                  ),
                                ),
                              ],
                            )),
                        // ])
                      ])),
                ))));
  }

  Widget _buildCarousel(BuildContext context) {
    final classes = [
      // widget.appointment.title,
      // widget.appointment.title,
      // widget.appointment.title,
      // widget.appointment.title,
      // widget.appointment.title,
    ];
    final tasks = [
      // widget.appointment.title + " huiswerk",
      // widget.appointment.title + " huiswerk",
      // widget.appointment.title + " huiswerk",
      // widget.appointment.title + " huiswerk",
      // widget.appointment.title + " huiswerk",
    ];
    final dates = ["Vandaag", "Morgen", "Morgen", "Overmorgen", "Overmorgen"];
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      itemCount: 0,
      itemBuilder: (BuildContext context, int itemIndex) {
        return HomeworkCard(
          title: classes[itemIndex],
          desc: tasks[itemIndex],
          date: dates[itemIndex],
          important: itemIndex == 0,
        );
      },
    );
  }
}
