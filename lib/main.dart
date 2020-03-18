import 'package:flutter/material.dart';
import 'package:zeta/pages/home/home.dart';
import 'package:zeta/utils/theme.dart';
import 'package:provider/provider.dart';

// void main() {
//   return runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: new SecondCalendarApp(),
    );
  }
}
