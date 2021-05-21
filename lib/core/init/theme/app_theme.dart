import 'package:flutter/material.dart';

import '../color/app_color.dart';
import 'IAppTheme.dart';

class AppTheme extends IAppTheme {
  static AppTheme? _instance;
  static AppTheme get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = AppTheme.init();
      return _instance!;
    }
  }

  AppColor get _color => AppColor.init();

  AppTheme.init();

  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme(
          primary: Colors.white,
          primaryVariant: Colors.white10,
          secondary: Colors.yellow,
          secondaryVariant: Colors.deepPurple,
          surface: Colors.red,
          background: Colors.black,
          error: Colors.teal.shade800,
          onPrimary: Colors.pink.shade800,
          onSecondary: Colors.deepPurple.shade900,
          onSurface: Colors.lightBlue,
          onBackground: Colors.brown,
          onError: Colors.pink.shade300,
          brightness: Brightness.light),
      iconTheme: IconThemeData(color: Colors.white),
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
      ),
      primaryColor: Colors.indigo.shade700,
      accentColor: _color.elm,
      errorColor: _color.malachite
      );
}
