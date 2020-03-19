import 'Announcement/AnnouncementManager.dart';
import 'Appointment/AppointmentManager.dart';
import 'package:http/http.dart' as http;
import 'School/SchoolManager.dart';
import 'User/UserManager.dart';
import 'dart:convert';
import 'Util.dart';

class Zermelo {
  String school;
  String accessToken;
  SchoolManager schools;
  UserManager users;
  AnnouncementsManager announcements;
  AppointmentManager appointments;

  static getAPI(String school, String accessToken) {
    return Zermelo(school, accessToken);
  }

  static getAccessToken(String school, String authCode) async {
    final authURL = "${ZermeloUtil.getApiURL(school)}/oauth/token";
    authCode = authCode.replaceAll(new RegExp(r'/\s/g'), '');
    print("$authURL?grant_type=authorization_code&code=$authCode");
    final response = await http
        .post("$authURL?grant_type=authorization_code&code=$authCode");
    if (response.statusCode == 200) {
      return json.decode(response.body)['access_token'];
    } else {
      throw Exception(
          "Server returned with an error ${response.statusCode} (${response.body})");
    }
  }

  Zermelo(String school, String accessToken) {
    this.school = school;
    this.accessToken = accessToken;

    this.schools = SchoolManager(school, accessToken);
    this.users = UserManager(school, accessToken);
    this.announcements = AnnouncementsManager(school, accessToken);
    this.appointments = AppointmentManager(school, accessToken);
  }
}

Zermelo zermelo;
