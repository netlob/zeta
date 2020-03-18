import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zeta/models/appointment.dart';
//
import 'package:zeta/utils/theme.dart';
import 'package:zeta/utils/wave.dart';

import 'package:zeta/pages/home/components/HomeworkCard.dart';

// import 'package:zeta/splash.dart';
// import 'package:zeta/fadeonscroll.dart';

class AppointmentDetails extends StatefulWidget {
  final Appointment appointment;
  AppointmentDetails({Key key, this.appointment}) : super(key: key);

  _AppointmentDetailsState createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails>
    with WidgetsBindingObserver {
  final ScrollController scrollController = ScrollController();
  PageController _pageController;
  Appointment appointment;

  @override
  void initState() {
    super.initState();
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
                          clipper: BottomWaveClipper(),
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
                                  onPressed: () {}),
                              // IconButton(
                              //     icon: Icon(Icons.search, color: Colors.white),
                              //     onPressed: () {}),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(65, 20, 20, 10),
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
                                          widget.appointment.title,
                                          // "Vandaag",
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text("HH:MM - HH:MM",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))
                                      ]),
                                  Text(widget.appointment.hour)
                                  // Icon(Icons.arrow_drop_down, color: Colors.white)
                                ])),
                        Container(
                            margin: EdgeInsets.only(top: 60),
                            height: 280,
                            child: _buildCarousel(context)),
                        Container(
                          margin: EdgeInsets.only(top: 250),
                          padding: EdgeInsets.all(50),
                          child: Text(
                              "idk hier wat info ofzo? geen idee wat zermelo allemaal meegeeft"),
                        ),
                        // ])
                      ])),
                ))));
  }

  Widget _buildCarousel(BuildContext context) {
    final classes = [
      widget.appointment.title,
      widget.appointment.title,
      widget.appointment.title,
      widget.appointment.title,
      widget.appointment.title,
    ];
    final tasks = [
      widget.appointment.title + " huiswerk",
      widget.appointment.title + " huiswerk",
      widget.appointment.title + " huiswerk",
      widget.appointment.title + " huiswerk",
      widget.appointment.title + " huiswerk",
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
