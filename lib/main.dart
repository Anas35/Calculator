import 'package:calculator/pages/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2C2F33),
        appBarTheme: AppBarTheme(
          color:  Color(0xFFF2C2F33),
          elevation: 0.0
        ),
      ),
      home: SafeArea(
        child: HomeScreen()
      )
      );
  }
}