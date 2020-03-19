import 'package:zeta/zermelo/User/User.dart';
import 'package:zeta/zermelo/Manager.dart';
import 'package:http/http.dart' as http;
import 'package:zeta/zermelo/Util.dart';
import 'dart:convert';

class UserManager extends ZermeloManager {
  String school;
  String accessToken;

  getAll() async {
    final response = await http
        .get(ZermeloUtil.createApiURL(this.school, "users", this.accessToken));
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map((user) => User.fromJson(json.decode(user)))
          .toList();
    } else {
      throw Exception('Failed to load user');
    }
  }

  get({id = "~me"}) async {
    final response = await http.get(
        ZermeloUtil.createApiURL(this.school, "users/$id", this.accessToken));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      throw Exception('Failed to load user');
    }
  }

  UserManager(String school, String accesstoken) {
    this.school = school;
    this.accessToken = accesstoken;
  }
}
