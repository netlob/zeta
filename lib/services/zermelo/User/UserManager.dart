import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:zeta/services/zermelo/Manager.dart';
import 'package:zeta/services/zermelo/User/User.dart';
import 'package:zeta/services/zermelo/Util.dart';

class UserManager extends ZermeloManager {
  String school;
  String accessToken;

  getAll() async {
    final response = await http
        .get(ZermeloUtil.createApiURL(this.school, "users", this.accessToken));
    if (response.statusCode == 200) {
      return json
          .decode(response.body)['response']['data']
          .map((user) => User.fromJson(json.decode(user)))
          .toList();
    } else {
      return throw Exception('Failed to load users');
    }
  }

  get({id = "~me"}) async {
    final response = await http.get(
        ZermeloUtil.createApiURL(this.school, "users/$id", this.accessToken));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body)['response']['data'][0]);
    } else {
      print(response.body.toString());
      return throw Exception('Failed to load user');
    }
  }

  UserManager(String school, String accesstoken) {
    this.school = school;
    this.accessToken = accesstoken;
  }
}
