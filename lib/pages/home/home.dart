import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:zeta/components/bottomnavbar.dart';
import 'package:zeta/utils/theme.dart';
import 'package:zeta/utils/wave.dart';

import 'package:zeta/pages/home/components/DayOverview.dart';
import 'package:zeta/pages/home/components/HomeworkCard.dart';

// import 'package:zeta/splash.dart';
// import 'package:zeta/fadeonscroll.dart';

class SecondCalendarApp extends StatefulWidget {
  SecondCalendarApp({Key key}) : super(key: key);

  _SecondCalendarAppState createState() => _SecondCalendarAppState();
}

class _SecondCalendarAppState extends State<SecondCalendarApp>
    with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();
  PageController _pageController;
  String page;
  String date;

  @override
  void initState() {
    super.initState();
    page = page ?? "Vandaag";
    date = date ?? "18 maart 2020";
    _pageController = PageController();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _pageController.dispose();
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
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zeta',
        theme: _themeChanger.getTheme(),
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
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.transparent,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    icon:
                                        Icon(Icons.search, color: Colors.white),
                                    onPressed: () {}),
                              ],
                            ),
                          ),
                          Container(
                              margin:
                                  EdgeInsets.fromLTRB(35, 20, 20, 10), // T: 130
                              child: Row(children: <Widget>[
                                Column(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        this.page.toString(),
                                        // "Vandaag",
                                        style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(this.date.toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                    ]),
                                // Icon(Icons.arrow_drop_down, color: Colors.white)
                              ])),
                          Container(
                              margin: EdgeInsets.only(top: 60),
                              height: 280,
                              child: _buildCarousel(context)),
                          Container(
                              margin: EdgeInsets.only(top: 250),
                              child: PageView(
                                controller: _pageController,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index) {
                                  setState(() {
                                    switch (index) {
                                      case 0:
                                        page = "Eergisteren";
                                        date = "16 maart 2020";
                                        break;
                                      case 1:
                                        page = "Gisteren";
                                        date = "17 maart 2020";
                                        break;
                                      case 2:
                                        page = "Vandaag";
                                        date = "18 maart 2020";
                                        break;
                                      case 3:
                                        page = "Morgen";
                                        date = "19 maart 2020";
                                        break;
                                      default:
                                        page = "Overmorgen";
                                        date = "20 maart 2020";
                                        break;
                                    }
                                  });
                                },
                                children: <Widget>[
                                  DayOverview(
                                      abr: "MAA",
                                      date: "16",
                                      color: AppColors.themes[AppColors.theme]
                                          ["appointmentDate"]),
                                  DayOverview(
                                      abr: "DIN",
                                      date: "17",
                                      color: AppColors.themes[AppColors.theme]
                                          ["appointmentDate"]),
                                  DayOverview(
                                      abr: "WOE",
                                      date: "18",
                                      color: Color.fromRGBO(123, 96, 247, 1)),
                                  DayOverview(
                                      abr: "DON",
                                      date: "19",
                                      color: AppColors.themes[AppColors.theme]
                                          ["appointmentDate"]),
                                  DayOverview(
                                      abr: "VRIJ",
                                      date: "20",
                                      color: AppColors.themes[AppColors.theme]
                                          ["appointmentDate"])
                                ],
                              ))
                          // ])
                        ])),
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.endFloat,
                    floatingActionButton: FloatingActionButton(
                      child: const Icon(Icons.search),
                      backgroundColor: Color.fromRGBO(252, 202, 46, 1),
                      onPressed: () {},
                    ),
                    bottomNavigationBar: BottomNavBar()))));
  }

  Widget _buildCarousel(BuildContext context) {
    final classes = [
      "Nederlands",
      "Aardrijkskunde",
      "Wiskunde B",
      "Geschiedenis",
      "Scheikunde"
    ];
    final tasks = [
      "Oefen SE afmaken",
      "H1 + H2 maken",
      "Nakijken H5",
      "Doorlezen §2",
      "Practicum af"
    ];
    final dates = ["Vandaag", "Morgen", "Morgen", "Overmorgen", "Overmorgen"];
    return PageView.builder(
      controller: PageController(viewportFraction: 0.8),
      itemCount: 5,
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
