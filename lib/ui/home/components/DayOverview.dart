import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zeta/constants/colors.dart';
import 'package:zeta/locator.dart';
import 'package:zeta/models/day.dart';
import 'package:zeta/services/zermelo/Appointment/Appointment.dart';
import 'package:zeta/services/zermelo_service.dart';
import 'package:zeta/ui/home/components/AppointmentCard.dart';

class DayOverview extends StatefulWidget {
  final Day day;
  DayOverview({Key key, this.day}) : super(key: key);

  _DayOverviewState createState() => _DayOverviewState();
}

class _DayOverviewState extends State<DayOverview> with WidgetsBindingObserver {
  final ZermeloService _zermeloService = locator<ZermeloService>();
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

  void _onRefresh(cntx) async {
    _zermeloService.fillDays(cntx);
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext _context) {
    setState(() => {this.appointments = widget.day.appointments});
    this.context = _context;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).copyWith().size.height - 400,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 23, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _getDayAbr(),
                            style: TextStyle(
                                color: AppColors.light["appointmentAbr"],
                                fontSize: 12),
                          ),
                          Text(
                            widget.day.date
                                .add(Duration(hours: 0))
                                .day
                                .toString(),
                            style: TextStyle(
                                color: AppColors.light["appointmentAbr"],
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
                      height: (MediaQuery.of(context).copyWith().size.height -
                          (259 - MediaQuery.of(context).padding.top)),
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      width:
                          (MediaQuery.of(context).copyWith().size.width - 60),
                      child: Stack(
                        children: <Widget>[
                          Visibility(
                            child: Center(
                              child: Text("Aan het laden...",
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            visible: (appointments.length == 0),
                          ),
                          SmartRefresher(
                            enablePullDown: true,
                            controller: _refreshController,
                            onRefresh: () => _onRefresh(context),
                            onLoading: _onLoading,
                            child: ListView.builder(
                              itemCount: appointments.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                if (index == 0) {
                                  return SizedBox(
                                    height: 20,
                                  );
                                } else {
                                  return AppointmentCard(
                                      appointment: appointments[index]);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ]
                  //   )
                  // ])),
                  ),
            )
          ],
        ),
      ),
    );
  }

  String _getDayAbr() {
    switch (widget.day.date.weekday - 1) {
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
