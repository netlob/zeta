import 'package:zeta/zermelo/Manager.dart';
import 'package:zeta/zermelo/Util.dart';
import 'package:zeta/zermelo/Announcement/Announcement.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnnouncementsManager extends ZermeloManager {
  get({user = "~me"}) async {
    final response = await http.get(ZermeloUtil.createApiURL(this.school,
        "announcements?user=$user&current=true", this.accessToken));
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map((school) => Announcement.fromJson(json.decode(school)))
          .toList()
          .sort((a, b) => a.start.compareTo(b.start));
    } else {
      throw Exception('Failed to load announcement');
    }
  }
}
