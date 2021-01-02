import 'package:calculator/pages/calculator_page.dart';
import 'package:calculator/src/converter/type.dart';
import 'package:calculator/pages/converter_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Type types = CalculatorPage;
  List<Type> typeList = [CalculatorPage, Temperature, Angle, Pressure, Length];

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
      case CalculatorPage: return CalculatorPage();
      case Temperature: return ConverterPage<Temperature>(converterTypes: Temperature.values);
      case Angle: return ConverterPage<Angle>(converterTypes: Angle.values);
      case Pressure: return ConverterPage<Pressure>(converterTypes: Pressure.values); 
      case Length: return ConverterPage<Length>(converterTypes: Length.values);
      default:
      return Container();
      }
  }

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
           ///TODO: to set value to zero          
           //    _keyBoardController.inputNumber = '0';
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