import 'package:zeta/pages/authenticate/authenticate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zeta/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:zeta/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Box box;

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('zetaBox');
  box = await Hive.openBox('zetaBox');
  String accessToken = await box.get('accessToken');
  runApp(ZetaApp(accessToken is String && accessToken.length > 2));
}

class ZetaApp extends StatelessWidget {
  final loggedIn;

  ZetaApp(this.loggedIn);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: this.loggedIn ? HomeView() : Authenticate(),
    );
  }
}
