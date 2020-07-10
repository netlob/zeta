import 'package:flutter/material.dart';
import 'package:zeta/constants/colors.dart';
import 'package:zeta/locator.dart';
import 'package:zeta/models/day.dart';
import 'package:zeta/routes.dart';
import 'package:zeta/services/zermelo_service.dart';
import 'package:zeta/ui/home/components/DayOverview.dart';
import 'package:zeta/ui/home/components/HomeworkCard.dart';
import 'package:zeta/ui/home/home.dart';

class SettingsView extends StatefulWidget {
  // final box = Hive.openBox('zetaBox');

  SettingsView({Key key}) : super(key: key);

  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with WidgetsBindingObserver {
  final ZermeloService _zermeloService = locator<ZermeloService>();
  String page = "Instellingen";
  String date = "is gay";

  List<Day> days = [];

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
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.light["background"],
      child: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Scaffold(
              body: Container(
                color: AppColors.light["background"],
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 20, 20, 10),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black87,
                                      size: 27,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Text(
                                    this.page,
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_drop_down, color: Colors.white)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ingelogd als",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    // _zermeloService.currentUser().firstName,
                                    // _zermeloService.currentUser().lastName,
                                    "Sjoerd Bolten",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    // _zermeloService.currentUser().firstName,
                                    // _zermeloService.currentUser().lastName,
                                    "Klas 6V2",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    // _zermeloService.currentUser().firstName,
                                    // _zermeloService.currentUser().lastName,
                                    "Jaar 2019/2020",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              FlatButton.icon(
                                onPressed: () async {
                                  await _zermeloService.logout();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      Routes.login,
                                      (Route<dynamic> route) => false);
                                },
                                icon: Icon(Icons.exit_to_app,
                                    color: Colors.white),
                                label: Text(
                                  "Uitloggen",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: AppColors.light["purpleColor"],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ingelogd als",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    // _zermeloService.currentUser().firstName,
                                    // _zermeloService.currentUser().lastName,
                                    "Sjoerd Bolten",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                  Text(
                                    // _zermeloService.currentUser().firstName,
                                    // _zermeloService.currentUser().lastName,
                                    "Klas 6V2",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                  Text(
                                    // _zermeloService.currentUser().firstName,
                                    // _zermeloService.currentUser().lastName,
                                    "Jaar 2019/2020",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                ],
                              ),
                              FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.exit_to_app,
                                    color: Colors.white),
                                label: Text(
                                  "Uitloggen",
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: AppColors.light["purpleColor"],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.endFloat,
              // floatingActionButton: FloatingActionButton(
              //   child: const Icon(Icons.add),
              //   backgroundColor: Color.fromRGBO(252, 202, 46, 1),
              //   onPressed: () => fillDays(context),
              // ),
              // bottomNavigationBar: BottomNavBar(),
            );
          },
        ),
      ),
    );
  }
}
