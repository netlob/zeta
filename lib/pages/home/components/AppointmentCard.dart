import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zeta/zermelo/appointment/appointment.dart';
import 'package:zeta/pages/appointmentdetails.dart';
import 'package:zeta/utils/theme.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  AppointmentCard({this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
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
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AppointmentDetails(appointment: appointment)),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 8, 0, 13),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 5, left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                this.appointment.id.toString(),
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
                                "10:00 - 11.10",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(226, 226, 226, 1)),
                              )
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(top: 15, right: 15),
                                  child: Center(
                                    child: Icon(Icons.assignment,
                                        size: 20,
                                        color:
                                            Color.fromRGBO(119, 112, 252, 1)),
                                  ))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Center(
                                    child: Text(
                                  this.appointment.start.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(119, 112, 252, 1)),
                                )))
                          ],
                        )
                      ],
                    ),
                  ),
                )));
    // );
  }
}
