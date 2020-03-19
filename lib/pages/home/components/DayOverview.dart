import 'package:zeta/pages/home/components/AppointmentCard.dart';
import 'package:zeta/zermelo/Appointment/Appointment.dart';
import 'package:zeta/zermelo/Zermelo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:zeta/utils/theme.dart';

class DayOverview extends StatefulWidget {
  final String abr;
  final String date;
  final Color color;
  DayOverview({Key key, this.abr, this.date, this.color}) : super(key: key);

  _DayOverviewState createState() => _DayOverviewState();
}

class _DayOverviewState extends State<DayOverview> with WidgetsBindingObserver {
  String abr;
  String date;
  Color color;
  BuildContext context;

  // _DayOverviewState({this.abr, this.date, this.color, this.context});

  List<Appointment> appointments;
  List<AppointmentCard> appointmentCards = [
    AppointmentCard(
        appointment: Appointment(
            id: 976527,
            start: 1,
            end: 2,
            startTimeSlot: 1,
            endTimeSlot: 2,
            subjects: ["yeet", "yaat"],
            teachers: ["yeet", "yaat"],
            groups: ["yeet", "yaat"],
            locations: ["yeet", "yaat"],
            type: "this.type",
            remark: "this.remark",
            valid: true,
            cancelled: false,
            modified: false,
            moved: false,
            isNew: true,
            changeDescription: "this.changeDescription"))
  ];

  Future<String> fetchCalendar() async {
    return "";
  }

  final _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async {
    if (zermelo == null) {
      Scaffold.of(this.context)
          .showSnackBar(SnackBar(content: Text('Niet ingelogd :(')));
      _refreshController.refreshFailed();
    } else {
      this.appointments = await zermelo.appointments
          .get(DateTime.utc(2020, 1, 1), DateTime.now());
      print(this.appointments);
      List<AppointmentCard> list = new List<AppointmentCard>();
      for (var i = 0; i < this.appointments.length; i++) {
        list.add(AppointmentCard(appointment: this.appointments[i]));
      }
      setState(() => list = appointmentCards);
      _refreshController.refreshCompleted();
    }
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext _context) {
    this.context = _context;
    return SmartRefresher(
        enablePullDown: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 3, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "this.abr",
                              style: TextStyle(
                                  color: AppColors.themes[AppColors.theme]
                                      ["appointmentAbr"],
                                  fontSize: 12),
                            ),
                            Text(
                              "this.date",
                              style: TextStyle(
                                  color: this.color,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),

                      // ConstrainedBox(
                      //     constraints: const BoxConstraints(
                      //         minWidth: double.infinity),
                      //     child:
                      Container(
                          // height: 100,
                          // margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Expanded(
                              child: Container(
                                  // height: height3 - 250,
                                  child: SingleChildScrollView(
                        //   height: 300,
                        child: Column(
                          // scrollDirection: Axis.vertical,
                          // mainAxisAlignment:
                          //     MainAxisAlignment.start,
                          children: this.appointmentCards,
                        ),
                      ))))
                      // ),
                      // )
                    ])),
              ],
            )));
  }
}
