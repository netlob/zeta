import 'package:flutter/material.dart';
import 'package:zeta/main.dart';
import 'package:zeta/models/day.dart';
import 'package:zeta/services/zermelo/Appointment/Appointment.dart';
import 'package:zeta/services/zermelo/User/User.dart';
import 'package:zeta/services/zermelo/Zermelo.dart';

class ZermeloService {
  User _currentUser;
  Zermelo _zermelo;

  ZermeloService() {
    print("init ZermeloService");

    dynamic school = box.get("school");
    dynamic accessToken = box.get("access_token");

    if (accessToken is String &&
        accessToken.length > 10 &&
        school is String &&
        school.length > 1) {
      _zermelo = Zermelo.getAPI(school, accessToken);

      _zermelo.users.get(id: "~me").then((dynamic user) {
        if (user is User) {
          print("ingelogd als: " + user.firstName.toString());
          _currentUser = user;
        }
      });
    }
  }

  get currentUser => _currentUser;
  get zermelo => _zermelo;

  Future<dynamic> login({
    @required String school,
    @required String code,
  }) async {
    dynamic accessToken = await Zermelo.getAccessToken(school, code);

    if (accessToken.toString().contains('400')) {
      return "De koppelcode is niet geldig :(";
    } else if (accessToken.toString().contains('404')) {
      return "De school is niet geldig :(";
    } else if (!(accessToken is String)) {
      return "Onbekende error, probeer het later nog eens :)";
    }

    _zermelo = Zermelo.getAPI(school, accessToken);

    _currentUser = await _zermelo.users.get(id: "~me");

    await box.putAll({
      "school": school,
      "access_token": accessToken,
      "is_logged_in": true,
    });

    print({
      "school": school,
      "access_token": accessToken,
      "is_logged_in": true,
    });

    return true;
  }

  Future<dynamic> logout() async {
    // _zermelo = null;

    // _currentUser = null;

    // await box.deleteAll([
    //   "school",
    //   "access_token",
    //   "is_logged_in",
    // ]);

    // print([
    //   "school",
    //   "access_token",
    //   "is_logged_in",
    // ]);

    return true;
  }

  Future<List<Day>> fillDays(context) async {
    if (_zermelo == null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Niet ingelogd :('),
        ),
      );
      return [];
    } else {
      List<dynamic> appointments = await _zermelo.appointments.get(
        DateTime.now().subtract(
          Duration(days: 14),
        ),
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );

      List<Day> days = [];

      for (var i = 0; i < appointments.length; i++) {
        final f = appointments[i];
        int dayIndex = -1;
        if (days.length != 0) {
          DateTime date = DateTime.fromMillisecondsSinceEpoch(f.start * 1000);
          final appDate = date.day.toString() + "/" + date.month.toString();

          dayIndex = days.indexWhere((d) =>
              ((d.date.day.toString() + "/" + d.date.month.toString()) ==
                  (appDate)));
        }

        if (dayIndex < 0) {
          Day day = Day(
              appointments: [],
              date: DateTime.fromMillisecondsSinceEpoch(f.start * 1000));

          day.appointments.add(f);

          days.add(day);
        } else {
          days[dayIndex].appointments.add(f);
        }
      }

      days.sort((Day a, Day b) => a.date.compareTo(b.date));

      days.forEach((day) {
        day.appointments
            .sort((Appointment a, Appointment b) => a.start.compareTo(b.start));
      });

      return days;
    }
  }
}
