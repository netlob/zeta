import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zeta/components/bottomnavbar.dart';
import 'package:zeta/models/Day.dart';
import 'package:zeta/utils/theme.dart';
import 'package:zeta/utils/wave.dart';

import 'package:zeta/pages/home/components/DayOverview.dart';
import 'package:zeta/pages/home/components/HomeworkCard.dart';
import 'package:zeta/zermelo/Appointment/Appointment.dart';
import 'package:zeta/zermelo/Zermelo.dart';

// import 'package:zeta/splash.dart';
// import 'package:zeta/fadeonscroll.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();
  PageController _pageController;
  String page;
  String date;

  List<Day> days = [];

  @override
  void initState() {
    super.initState();
    page = page ?? "Vandaag";
    date = date ?? "18 maart 2020";
    _pageController = PageController();
    WidgetsBinding.instance.addObserver(this);
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
      List<dynamic> appointments = await zermelo.appointments
          .get(DateTime.fromMillisecondsSinceEpoch(1584313200), DateTime.now());

      List<Day> list = [];

      for (Appointment f in appointments) {
        int dayIndex = 0;
        if (list.length != 0) {
          final appDate =
              _dayOfYear(DateTime.fromMillisecondsSinceEpoch(f.start * 1000));

          dayIndex = list.indexWhere((d) => _dayOfYear(d.date) == appDate);

          debugPrint(appDate.toString());
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
      for (Day d in days) {
        d.appointments.sort((a, b) => a.compareTo(b));
      }
      setState(() => {days = list});
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
                              child: PageView.builder(
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index) {},
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
}

int _dayOfYear(DateTime a) {
  final diff = a.difference(DateTime(DateTime.now().year, 1, 1, 0, 0));
  final diffInDays = diff.inDays;
  if (a.day == 20) {
    debugPrint(diffInDays.toString() + " " + a.toString());
  }
  return diffInDays.round();
}
