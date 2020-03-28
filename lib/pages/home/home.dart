import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:zeta/components/bottomnavbar.dart';
import 'package:zeta/models/Day.dart';
import 'package:zeta/main.dart';
import 'package:zeta/utils/theme.dart';
import 'package:zeta/utils/wave.dart';

import 'package:zeta/pages/home/components/DayOverview.dart';
import 'package:zeta/pages/home/components/HomeworkCard.dart';
import 'package:zeta/zermelo/Zermelo.dart';

class HomeView extends StatefulWidget {
  final box = Hive.openBox('zetaBox');

  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();
  PageController _pageController;
  String page = "php";
  String date = "is gay";

  List<Day> days = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); //viewportFraction: 1 / 3);
    WidgetsBinding.instance.addObserver(this);
    initZermelo();
  }

  initZermelo() async {
    final accessToken = await box.get('accessToken');
    final school = await box.get('school');

    zermelo = Zermelo.getAPI(school, accessToken);
    if (accessToken is Exception)
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Inlog faal :("),
              content: Text(accessToken.toString()),
            );
          });

    final userInfo = await zermelo.users.get(id: "~me");
    if (userInfo is Exception)
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Inlog faal :("),
              content: Text(userInfo.toString()),
            );
          });
    fillDays();
  }

  @override
  void dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> fillDays() async {
    setState(() => {days = []});
    print("refreshing days");
    if (zermelo == null) {
      Scaffold.of(this.context)
          .showSnackBar(SnackBar(content: Text('Niet ingelogd :(')));
    } else {
      List<dynamic> appointments = await zermelo.appointments.get(
          DateTime.fromMillisecondsSinceEpoch(1584313200),
          DateTime.now().add(Duration(hours: 1)));

      List<Day> list = [];

      // for (Appointment f in appointments) {
      for (var i = 0; i < appointments.length; i++) {
        final f = appointments[i];
        // int dayIndex = 0;
        // if (list.length != 0) {
        //   final appDate =
        //       _dayOfYear(DateTime.fromMillisecondsSinceEpoch(f.start * 1000));

        //   dayIndex = list.indexWhere((d) => _dayOfYear(d.date) == appDate);

        //   debugPrint(appDate.toString());
        // }
        // if (dayIndex < 1) {
        //   Day day = Day(
        //       appointments: [],
        //       date: DateTime.fromMillisecondsSinceEpoch(f.start * 1000));
        //   day.appointments.add(f);
        //   list.add(day);
        // } else {
        //   list[dayIndex].appointments.add(f);
        // }
        int dayIndex = 0;
        if (list.length != 0) {
          final appDate = DateTime.fromMillisecondsSinceEpoch(f.start * 1000)
                  .day
                  .toString() +
              "/" +
              DateTime.fromMillisecondsSinceEpoch(f.start * 1000)
                  .month
                  .toString();
          dayIndex = list.indexWhere((d) =>
              ((d.date.day.toString() + "/" + d.date.month.toString()) ==
                  (appDate)));
          list.forEach((d) => debugPrint(
              (d.date.day.toString() + "/" + d.date.month.toString()) +
                  "  " +
                  (appDate)));
          debugPrint("day" + appDate + "yeet" + dayIndex.toString());
        }
        if (dayIndex < 1) {
          Day day = Day(
              appointments: [],
              date: DateTime.fromMillisecondsSinceEpoch(f.start * 1000));
          day.appointments.add(f);
          list.add(day);
        } else {
          list[dayIndex].appointments.add(f);
        }
      }
      setState(() => {days = list});
      for (Day d in days) {
        d.appointments.sort((a, b) => a.compareTo(b));
        debugPrint("d:" +
            d.appointments.length.toString() +
            " yeet " +
            (d.date.day.toString() + "/" + d.date.month.toString()));
      }
      debugPrint("dayslength: " + days.length.toString());
    }
  }

  @override
  void didChangePlatformBrightness() {
    // final Brightness brightness =
    //     WidgetsBinding.instance.window.platformBrightness;
    //inform listeners and rebuild widget tree
  }
  @override
  Widget build(BuildContext context) {
    // ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Zeta',
        // theme: _themeChanger.getTheme(),
        theme: ThemeData(fontFamily: "Nunito"),
        home: Container(
            color: AppColors.themes[AppColors.theme]["backgroundAccent"],
            child: SafeArea(
                bottom: false,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Scaffold(
                      body: Container(
                          color: AppColors.themes[AppColors.theme]
                              ["background"],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(
                                        Icons.calendar_today,
                                        color: Colors.transparent,
                                      ),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(Icons.search,
                                          color: Colors.white),
                                      onPressed: () {}),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(
                                    35, 20, 20, 10), // T: 130
                                child: Row(children: <Widget>[
                                  Column(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          this.page,
                                          // "Vandaag",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                            "${date[0].toUpperCase()}${date.substring(1)}",
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
                                child: PageView.builder(
                                    controller: _pageController,
                                    scrollDirection: Axis.horizontal,
                                    onPageChanged: (index) {
                                      setState(() {
                                        // this.page = DateFormat('EEEEE', "nl_NL")
                                        //     .format(days[index]
                                        //         .date
                                        //         .add(Duration(days: 1)))
                                        //     .toString();
                                        this.page = _getDayReference(days[index]
                                            .date
                                            .add(Duration(hours: 1)));
                                        this.date =
                                            DateFormat('EEEEE dd MMMM', "nl_NL")
                                                .format(days[index]
                                                    .date
                                                    .add(Duration(hours: 1)))
                                                .toString();
                                      });
                                    },
                                    itemCount: days.length,
                                    itemBuilder: (contxt, index) {
                                      return DayOverview(day: days[index]);
                                    }))
                            // ])
                          ])),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.endFloat,
                      floatingActionButton: FloatingActionButton(
                        child: const Icon(Icons.refresh),
                        backgroundColor: Color.fromRGBO(252, 202, 46, 1),
                        onPressed: fillDays,
                      ),
                      bottomNavigationBar: BottomNavBar());
                }))));
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
      scrollDirection: Axis.horizontal,
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

  String _getDayReference(DateTime date) {
    final diff =
        date.difference(DateTime.now().add(Duration(hours: 1))).inDays - 1;
    if (diff == -2) {
      return "Eergisteren";
    } else if (diff == -1) {
      return "Gisteren";
    } else if (diff == 0) {
      return "Vandaag";
    } else if (diff == 1) {
      return "Morgen";
    } else if (diff == 2) {
      return "Overmorgen";
    } else if (diff > 2) {
      return "Over^${diff}morgen";
    } else if (diff < 2) {
      return "Eer^${diff * -1}gisteren";
    } else {
      return "Vandaag";
    }
  }
}

// int _dayOfYear(DateTime a) {
//   final diff = a.difference(
//       DateTime(DateTime.now().add(Duration(hours: 1)).year, 1, 1, 0, 0));
//   final diffInDays = diff.inDays;
//   if (a.day == 20) {
//     debugPrint(diffInDays.toString() + " " + a.toString());
//   }
//   return diffInDays.round();
// }
