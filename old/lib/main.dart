import 'dart:io';

import 'package:intl/date_symbol_data_local.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zeta/pages/authenticate/authenticate.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zeta/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:zeta/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Register all the models and services before the app starts

  Directory appDocDirectory = await getApplicationDocumentsDirectory();

  Directory dir =
      await Directory(appDocDirectory.path + '/hive').create(recursive: true);

  var path = dir.path;
  Hive..init(path);

  box = await Hive.openBox('zetaBox');

  runApp(ZetaApp(await box.get('accessToken') is String &&
      await box.get('accessToken').length > 2));
  initializeDateFormatting("nl_NL", null).then((_) {});
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
