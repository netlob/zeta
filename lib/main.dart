import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:inject/inject.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zeta/constants/app_theme.dart';
import 'package:zeta/constants/strings.dart';
import 'package:zeta/locator.dart';
import 'package:zeta/routes.dart';
import 'package:zeta/ui/splash/splash.dart';

// global instance for app component

Box box;
bool darkMode = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    // appComponent = await AppComponent.create(
    //   NetworkModule(),
    //   LocalModule(),
    //   PreferenceModule(),
    // );
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory dir =
        await Directory(appDocDirectory.path + '/hive').create(recursive: true);

    var path = dir.path;
    Hive..init(path);

    box = await Hive.openBox('zetaBox');
    await box.put("is_logged_in", false);
    runApp(MyApp());
  });
}

@provide
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Observer(
    //   builder: (context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: box.get(
        "darkmode",
        defaultValue: false,
      )
          ? themeDataDark
          : themeData,
      routes: Routes.routes,
      home: SplashScreen(),
    );
    //     },
    //   );
  }
}
