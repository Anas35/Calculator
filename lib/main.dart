import 'package:calculator/pages/calculator_page.dart';
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
      canvasColor: Color(0xFFF2C2F33),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          primary: Colors.white) )
      ),
      home: SafeArea(
        child: CalculatorPage(),
       )
      );
  }
}