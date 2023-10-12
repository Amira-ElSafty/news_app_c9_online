import 'package:flutter/material.dart';
import 'package:flutter_news_app_c9_online/home/category/category_details.dart';
import 'package:flutter_news_app_c9_online/home/home_screen.dart';
import 'package:flutter_news_app_c9_online/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
    );
  }
}
