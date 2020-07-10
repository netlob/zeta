import 'package:flutter/material.dart';
import 'package:zeta/zermelo/Appointment/Appointment.dart';
import 'package:zeta/zermelo/Manager.dart';
import 'package:http/http.dart' as http;
import 'package:zeta/zermelo/Util.dart';
import 'dart:convert';

class AppointmentManager extends ZermeloManager {
  String school;
  String accessToken;

  Future<List> get(DateTime startDate, DateTime endDate, {user = "~me"}) async {
    debugPrint(
        "appointments?user=$user&start=${(startDate.millisecondsSinceEpoch).round()}&end=${(endDate.millisecondsSinceEpoch).round()}");
    final response = await http.get(ZermeloUtil.createApiURL(
        this.school,
        "appointments?user=$user&start=1584313200&end=1584918000",
        this.accessToken));
    if (response.statusCode == 200) {
      return json
          .decode(response.body)['response']['data']
          .map((appointment) => Appointment.fromJson(appointment))
          .toList();
      //     .sort((a, b) {
      //   debugPrint(a.start.toString());
      //   debugPrint(b.start.toString());
      //   // var aDate = a.start; //DateTime.fromMicrosecondsSinceEpoch(a.start);
      //   // var bDate = b.start; //DateTime.fromMicrosecondsSinceEpoch(b.start);
      //   a.compareTo(b);
      // });
    } else {
      print(
          "Server returned with an error ${response.statusCode} (${response.body})");
      throw Exception('Failed to load appointments');
    }
  }

  getParticipations(int year, num weeknumber, {user = "~me"}) async {
    if (weeknumber <= 52 && weeknumber >= 1) {
      final response = await http.get(ZermeloUtil.createApiURL(
          this.school,
          "appointmentparticipations?student=$user&week=$year${weeknumber.round()}&fields=id,appointmentInstance,studentInDepartment,optional,studentEnrolled,attendanceParticipationCoordinator,plannedAttendance,realizedAttendance,publicComment,start,end,subjects,teachers,locations,groups,schedulerRemark,changeDescription,startTimeSlotName,endTimeSlotName,allowedStudentActions,availableSpace,cancelled,appointmentType,content",
          this.accessToken));
      if (response.statusCode == 200) {
        return json
            .decode(response.body)
            .map(
                (appointment) => Appointment.fromJson(json.decode(appointment)))
            .toList()
            .sort((a, b) => a.start.compareTo(b.start));
      } else {
        throw Exception('Failed to load appointments');
      }
    } else
      throw Exception('Weeknumber must be between 1-52');
  }

  AppointmentManager(String school, String accesstoken) {
    this.school = school;
    this.accessToken = accesstoken;
  }
}
