import 'package:flutter/cupertino.dart';

class AppColor {
  static AppColor? _instance;
  static AppColor get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = AppColor.init();
      return _instance!;
    }
  }

  AppColor.init();

  final Color elm = Color(0xff1C7A74);
  final Color malachite = Color(0xff14D860);
}
