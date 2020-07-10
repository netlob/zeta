import 'package:flutter/material.dart';
import 'package:zeta/constants/colors.dart';
import 'package:zeta/locator.dart';
import 'package:zeta/models/day.dart';
import 'package:zeta/routes.dart';
import 'package:zeta/services/zermelo_service.dart';
import 'package:zeta/ui/home/components/DayOverview.dart';
import 'package:zeta/ui/home/components/HomeworkCard.dart';

class HomeView extends StatefulWidget {
  // final box = Hive.openBox('zetaBox');

  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver {
  final ZermeloService _zermeloService = locator<ZermeloService>();
  PageController _pageController;
  String page = "php";
  String date = "is gay";

  List<Day> days = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); //viewportFraction: 1 / 3);
    WidgetsBinding.instance.addObserver(this);
    // initZermelo();
    // fillDays(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> fillDays(cntx) async {
    days = await _zermeloService.fillDays(cntx);

    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.light["backgroundAccent"],
      child: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Scaffold(
              body: Container(
                color: AppColors.light["background"],
                child:
                    // Column(children: [
                    Stack(
                  children: <Widget>[
                    // Stack(children: <Widget>[
                    ClipPath(
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.light["backgroundAccent"]),
                          height: 210),
                      clipper: BottomWaveLeft(),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          // IconButton(
                          //   icon: Icon(Icons.search, color: Colors.white),
                          //   onPressed: () {},
                          // ),
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                Routes.settings,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(35, 20, 20, 10), // T: 130
                      child: Row(
                        children: <Widget>[
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                this.page,
                                // "Vandaag",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                // "${date[0].toUpperCase()}${date.substring(1)}",
                                // _getDayName(),
                                this.date,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          // Icon(Icons.arrow_drop_down, color: Colors.white)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      height: 280,
                      child: _buildCarousel(context),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 230),
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index) {
                          setState(() {
                            var dayReference = _getDayReference(
                              days[index].date.add(Duration(hours: 1)),
                            );

                            this.page = dayReference[0];
                            this.date = dayReference[1];
                          });
                        },
                        itemCount: days.length,
                        itemBuilder: (contxt, index) {
                          // return Container();
                          return DayOverview(
                            day: days[index],
                          );
                        },
                      ),
                    ),
                    // ])
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                backgroundColor: Color.fromRGBO(252, 202, 46, 1),
                onPressed: () => fillDays(context),
              ),
              // bottomNavigationBar: BottomNavBar(),
            );
          },
        ),
      ),
    );
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

  List<String> _getDayReference(DateTime date) {
    final now =
        DateTime.now().add(Duration(hours: 1)).subtract(Duration(days: 10));
    final diff = date.difference(now).inDays - 1;
    if (diff == -2) {
      return ["Eergisteren", _getDayName(date, true)];
    } else if (diff == -1) {
      return ["Gisteren", _getDayName(date, true)];
    } else if (diff == 0) {
      return ["Vandaag", _getDayName(date, true)];
    } else if (diff == 1) {
      return ["Morgen", _getDayName(date, true)];
    } else if (diff == 2) {
      return ["Overmorgen", _getDayName(date, true)];
    } else if (diff > 2) {
      return ["Overmorgen", _getDayName(date, true)];
    } else if (diff < 2) {
      return [
        "${date.day.toString()} ${_getMonthName(date)} ${date.year != DateTime.now().year ? date.year.toString() : ""}",
        _getDayName(date, false)
      ];
    } else if (diff == 0) {
      return ["Vandaag", _getDayName(date, true)];
    }
    return ["welp", "error ofzoo"];
  }

  String _getMonthName(DateTime date) {
    switch (date.month) {
      case 1:
        return "Jan";
        break;
      case 2:
        return "Feb";
        break;
      case 3:
        return "Maart";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "Mei";
        break;
      case 6:
        return "Juni";
        break;
      case 7:
        return "Juli";
        break;
      case 8:
        return "Aug";
        break;
      case 9:
        return "Sept";
        break;
      case 10:
        return "Okt";
        break;
      case 11:
        return "Nov";
        break;
      case 12:
        return "Dec";
        break;
    }
    return "";
  }

  String _getDayName(DateTime date, bool full) {
    String extra = "";
    if (full) {
      extra = " ${date.day.toString()} ${_getMonthName(date)}";
    }
    switch (date.weekday) {
      case 1:
        return "Maandag$extra";
        break;
      case 2:
        return "Dinsdag$extra";
        break;
      case 3:
        return "Woensdag$extra";
        break;
      case 4:
        return "Donderdag$extra";
        break;
      case 5:
        return "Vrijdag$extra";
        break;
      case 6:
        return "Zaterdag$extra";
        break;
      case 7:
        return "Zondag$extra";
        break;
    }
    return "";
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 8), size.height - 85);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class BottomWaveLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 8, size.height);
    var firstEndPoint = Offset(size.width / 2.5, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 8), size.height - 85);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 80);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
