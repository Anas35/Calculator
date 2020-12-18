import 'package:calculator/src/converter/temperature.dart';
import 'package:calculator/src/converter/type.dart';
import 'package:calculator/widgets/custom_widget/content_screen.dart';
import 'package:calculator/widgets/custom_widget/keyboard.dart';
import 'package:calculator/widgets/custom_widget/keyboard_function.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Type types = Temperature;
  List<Type> typeList = [Temperature, Angle, Pressure, Length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(title: Text(types.toString())),
      body: _body(),
    );
  }

  Widget _body() {
    switch (types) {
      case Temperature: return ContentScreen<Temperature>(types: Temperature.values);
      case Angle: return ContentScreen<Angle>(types: Angle.values);
      case Pressure: return ContentScreen<Pressure>(types: Pressure.values); 
      case Length: return ContentScreen<Length>(types: Length.values);
      default:
      return Container();
      }
  }

  KeyBoardController _keyBoardController = KeyBoardController.instance;

  Drawer _drawer() {
    return Drawer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(typeList.length, (index) {
          return TextButton(
            onPressed: (){
             setState(() {
               types = typeList[index];
               _keyBoardController.inputText = '0';
             });
             Navigator.pop(context);
            },
            child: Text(typeList[index].toString()),
          );
        }),
      ),
    );
  }
}