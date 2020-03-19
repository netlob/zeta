import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:zeta/utils/theme.dart';

import 'package:zeta/zermelo/appointment/appointment.dart';

import 'package:zeta/pages/home/components/AppointmentCard.dart';

class DayOverview extends StatelessWidget {
  final String abr;
  final String date;
  final Color color;

  DayOverview({this.abr, this.date, this.color});

  Future<String> fetchCalendar() async {
    // await http.get('https://jsonplaceholder.typicode.com/albums/1');

    // if (response.statusCode == 200) {
    // return //.fromJson(json.decode(response.body));
    // } else {
    // throw Exception('Failed to load album');
    return "";
    // [
    //   Appointment(title: "Nederlands", hour: "1"),
    //   Appointment(title: "Nederlands", hour: "2"),
    //   Appointment(title: "Aardrijkskunde", hour: "3"),
    //   Appointment(title: "Geschiedenis", hour: "4"),
    //   Appointment(title: "Wiskunde B", hour: "5"),
    //   Appointment(title: "Wiskunde B", hour: "6"),
    //   Appointment(title: "Frans", hour: "7"),
    //   Appointment(title: "Mentorles", hour: "8")
    // ];
    // }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchCalendar(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<Widget> children;

        if (snapshot.hasData) {
          return Container(
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
                                this.abr,
                                style: TextStyle(
                                    color: AppColors.themes[AppColors.theme]
                                        ["appointmentAbr"],
                                    fontSize: 12),
                              ),
                              Text(
                                this.date,
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
                            children: <Widget>[
                              // AppointmentCard(
                              //     appointment: Appointment(
                              //         title: "Nederlands", hour: "1")),
                              AppointmentCard(
                                  appointment: Appointment(
                                      id: 420,
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
                                      modified: true,
                                      moved: false,
                                      isNew: true,
                                      changeDescription:
                                          "this.changeDescription"))
                            ],
                          ),
                        ))))
                        // ),
                        // )
                      ])),
                ],
              ));
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Rooster ophalen...'),
            )
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
