import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:zeta/utils/theme.dart';

import 'package:zeta/models/appointment.dart';

import 'package:zeta/pages/home/components/AppointmentCard.dart';

class DayOverview extends StatelessWidget {
  final String abr;
  final String date;
  final Color color;

  DayOverview({this.abr, this.date, this.color});

  @override
  Widget build(BuildContext context) {
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
                        AppointmentCard(
                          appointment:
                              Appointment(title: "Nederlands", hour: "1"),
                        ),
                        AppointmentCard(
                          appointment:
                              Appointment(title: "Nederlands", hour: "2"),
                        ),
                        AppointmentCard(
                          appointment:
                              Appointment(title: "Aardrijkskunde", hour: "3"),
                        ),
                        AppointmentCard(
                          appointment:
                              Appointment(title: "Geschiedenis", hour: "4"),
                        ),
                        // AppointmentCard(
                        //   appointment:
                        //       Appointment(title: "Wiskunde B", hour: "5"),
                        // ),
                        AppointmentCard(
                          appointment:
                              Appointment(title: "Wiskunde B", hour: "6"),
                        ),
                        // AppointmentCard(
                        //   appointment: Appointment(title: "Frans", hour: "7"),
                        // ),
                        // AppointmentCard(
                        //   appointment:
                        //       Appointment(title: "Mentorles", hour: "8"),
                        // ),
                      ],
                    ),
                  ))))
                  // ),
                  // )
                ])),
            // Divider(),
            // Container(
            //     child: Row(
            //         crossAxisAlignment:
            //             CrossAxisAlignment.start,
            //         mainAxisAlignment:
            //             MainAxisAlignment.start,
            //         children: <Widget>[
            //       Container(
            //         margin:
            //             EdgeInsets.fromLTRB(15, 3, 0, 0),
            //         child: Column(
            //           mainAxisAlignment:
            //               MainAxisAlignment.start,
            //           children: <Widget>[
            //             Text(
            //               "DON",
            //               style: TextStyle(
            //                   color: Colors.black26,
            //                   fontSize: 12),
            //             ),
            //             Text(
            //               "13",
            //               style: TextStyle(
            //                   color: Color.fromRGBO(
            //                       85, 85, 106, 1),
            //                   fontSize: 30,
            //                   fontWeight: FontWeight.bold),
            //             )
            //           ],
            //         ),
            //       ),

            //       // ConstrainedBox(
            //       //     constraints: const BoxConstraints(
            //       //         minWidth: double.infinity),
            //       //     child:
            //       Container(
            //         // margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            //         child: Expanded(
            //           child: Column(
            //             // mainAxisAlignment:
            //             //     MainAxisAlignment.start,
            //             children: <Widget>[
            //               AppointmentCard(
            //                 title: "Nederlands",
            //                 hour: "1",
            //               ),
            //               AppointmentCard(
            //                 title: "Geschiedenis",
            //                 hour: "2",
            //               ),
            //               // AppointmentCard(
            //               //   title: "Aardrijkskunde",
            //               //   hour: "3",
            //               // ),
            //               // AppointmentCard(
            //               //   title: "Aardrijkskunde",
            //               //   hour: "4",
            //               // ),
            //               // AppointmentCard(
            //               //   title: "Aardrijkskunde",
            //               //   hour: "5",
            //               // ),
            //               // AppointmentCard(
            //               //   title: "Aardrijkskunde",
            //               //   hour: "6",
            //               // ),
            //             ],
            //           ),
            //           // )
            //         ),
            //       ),
            // ]))
          ],
        ));
  }
}
