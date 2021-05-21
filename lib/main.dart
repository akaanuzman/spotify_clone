import 'package:flutter/material.dart';
import 'package:spotify_clone/feature/home_page/view/home_page_view.dart';

import 'core/init/theme/app_theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.theme,
      home: HomePageView(),
    );
  }
}