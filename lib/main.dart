import 'package:intl/date_symbol_data_local.dart';
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
  runApp(ZetaApp(await box.get('accessToken') is String && await box.get('accessToken').length > 2));
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
