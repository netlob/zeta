import 'package:zeta/models/Day.dart';
import 'package:zeta/pages/home/components/AppointmentCard.dart';
import 'package:zeta/zermelo/Appointment/Appointment.dart';
import 'package:zeta/zermelo/Zermelo.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:zeta/utils/theme.dart';

class DayOverview extends StatefulWidget {
  final Day day;
  DayOverview({Key key, this.day}) : super(key: key);

  _DayOverviewState createState() => _DayOverviewState();
}

class _DayOverviewState extends State<DayOverview> with WidgetsBindingObserver {
  // Day day;
  BuildContext context;

  // _DayOverviewState(this.day);

  Future<String> fetchCalendar() async {
    return "";
  }

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

  final _refreshController = RefreshController(initialRefresh: false);

  List<Appointment> appointments = [];

  void _onRefresh() async {
    if (zermelo == null) {
      Scaffold.of(this.context)
          .showSnackBar(SnackBar(content: Text('Niet ingelogd :(')));
      _refreshController.refreshFailed();
    } else {
      List<dynamic> list = await zermelo.appointments.get(
          DateTime.fromMicrosecondsSinceEpoch(widget.day.appointments[0].start),
          DateTime.fromMicrosecondsSinceEpoch(
              widget.day.appointments[widget.day.appointments.length - 1].end));

      debugPrint(list.toString());
      list.forEach((f) => {
            setState(() => {this.appointments.add(f)})
          });
      _refreshController.refreshCompleted();
    }
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext _context) {
    setState(() => {this.appointments = widget.day.appointments});
    this.context = _context;
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(children: <Widget>[
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
                        _getDayAbr(),
                        style: TextStyle(
                            color: AppColors.themes[AppColors.theme]
                                ["appointmentAbr"],
                            fontSize: 12),
                      ),
                      Text(
                        widget.day.date.add(Duration(days: 1)).day.toString(),
                        style: TextStyle(
                            color: AppColors.themes[AppColors.theme]
                                ["appointmentAbr"],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                // ConstrainedBox(
                //     constraints:
                //         const BoxConstraints(minWidth: double.infinity),
                //    child:
                Container(
                    height: 520,
                    width: 350,
                    child: SmartRefresher(
                        enablePullDown: true,
                        controller: _refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        child: ListView.builder(
                            itemCount: appointments.length,
                            itemBuilder: (BuildContext ctxt, int index) =>
                                AppointmentCard(
                                    appointment: appointments[index]))) //)
                    )
              ]
                  //   )
                  // ])),
                  ))
        ]));
  }

  String _getDayAbr() {
    switch (widget.day.date.weekday) {
      case 0:
        return "MAA";
        break;
      case 1:
        return "DIN";
        break;
      case 2:
        return "WOE";
        break;
      case 3:
        return "DON";
        break;
      case 4:
        return "VRI";
        break;
      case 5:
        return "SAT";
        break;
      case 6:
        return "ZON";
        break;
      default:
        return "?";
        break;
    }
  }
}
