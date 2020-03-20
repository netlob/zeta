import 'package:zeta/zermelo/Appointment/Appointment.dart';
import 'package:zeta/pages/appointmentdetails.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:zeta/utils/theme.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  AppointmentCard({this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: (_getTypeColor() != Colors.transparent
              ? BorderRadius.horizontal(right: Radius.circular(15))
              : BorderRadius.all(Radius.circular(15))),
          color: AppColors.themes[AppColors.theme]["appointmentBackground"],
          // border: Border(bottom: BorderSide(color: Colors.black12))
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        // margin: EdgeInsets.only(top: 3, bottom: 3, left: 10),
        child: //ConstrainedBox(
            // constraints: const BoxConstraints(minWidth: double.infinity),
            // child:
            Material(
                type: MaterialType.transparency,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AppointmentDetails(appointment: appointment)),
                      );
                    },
                    child: Stack(children: <Widget>[
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 70,
                        width: 5,
                        decoration: BoxDecoration(
                          color: _getTypeColor(),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 8, 0, 13),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5, left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    this.appointment.subjects[0].toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.themes[AppColors.theme]
                                          ["appointmentTitle"],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Lokaal ${this.appointment.locations[0].toString()} // ${DateFormat('Hm').format(DateTime.fromMillisecondsSinceEpoch(this.appointment.start * 1000))} - ${DateFormat('Hm').format(DateTime.fromMillisecondsSinceEpoch(this.appointment.end * 1000))}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Color.fromRGBO(226, 226, 226, 1)),
                                  )
                                ],
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 15, right: 15),
                                      child: Center(
                                        child: Icon(Icons.assignment,
                                            size: 20,
                                            color: Color.fromRGBO(
                                                119, 112, 252, 1)),
                                      ))
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(top: 12),
                                    child: Center(
                                        child: Text(
                                      this.appointment.startTimeSlot.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(119, 112, 252, 1)),
                                    )))
                              ],
                            )
                          ],
                        ),
                      )
                    ]))));
    // );
  }

  Color _getTypeColor() {
    if (this.appointment.cancelled) return Color.fromRGBO(255, 100, 100, 1);
    if (this.appointment.moved) return Colors.orange;
    if (this.appointment.modified) return Colors.blue;
    if (this.appointment.valid) return Colors.green;
    return Colors.transparent;
  }
}
