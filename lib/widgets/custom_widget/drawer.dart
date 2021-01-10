import 'package:calculator/pages/calculator_page.dart';
import 'package:calculator/pages/converter_page.dart';
import 'package:calculator/src/converter/type.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  final List<Type> myType = [
    CalculatorPage,
  Temperature,
  Angle,
  Pressure,
  Volume,
  Length,
  Weight_and_Mass,
  Energy,
  Area,
  Speed,
  Time,
  Power
  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
          child: Drawer(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget(context),
        ),
      ),
    );
  }

  List<Widget> widget(BuildContext context) {
    List<Widget> temp = [
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.dehaze, size: 32, color: Colors.white,)),];
    List.generate(myType.length, (index) {
          temp.add( TextButton(
            onPressed: (){
             Navigator.pushReplacement(context, MaterialPageRoute(
               builder: (context) => _body(myType[index])
             ));
            },
            child: Text(myType[index].toString()),
          ));
        });

        return temp;
  }

   Widget _body(Type types) {
    switch (types) {
      case CalculatorPage: return CalculatorPage();
      case Temperature: return ConverterPage<Temperature>(converterTypes: Temperature.values);
      case Angle: return ConverterPage<Angle>(converterTypes: Angle.values);
      case Pressure: return ConverterPage<Pressure>(converterTypes: Pressure.values); 
      case Length: return ConverterPage<Length>(converterTypes: Length.values);
      case Volume: return ConverterPage<Volume>(converterTypes: Volume.values,);
      case Weight_and_Mass: return ConverterPage<Weight_and_Mass>(converterTypes: Weight_and_Mass.values,);
      case Energy: return ConverterPage<Energy>(converterTypes: Energy.values,);
      case Area: return ConverterPage<Area>(converterTypes: Area.values,);
      case Speed: return ConverterPage<Speed>(converterTypes: Speed.values,);
      case Time: return ConverterPage<Time>(converterTypes: Time.values,);
      case Power: return ConverterPage<Power>(converterTypes: Power.values,);
      default:
      return Container();
      }
  }
}