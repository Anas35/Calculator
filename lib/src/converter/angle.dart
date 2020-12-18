import 'dart:math' as math;
import 'package:calculator/extension.dart';

enum Angle {
  Degree,
  Radian,
  Gradian,
}

class AngleConverter {

  static final AngleConverter _temperatureConverter = AngleConverter._internal();

  AngleConverter._internal();

  static AngleConverter get instance => _temperatureConverter;

  String _toDegree() {
    return _angleType(
    fromDegree: _values,
    fromRadian: _values * 180/math.pi,
    fromGradian: _values * 180/200,
   );
  }

  String _toRadain() {
    return _angleType(
    fromDegree: _values * math.pi/180,
    fromRadian: _values,
    fromGradian: _values * math.pi/200,
   );
  }

  String _toGradian() {
    return _angleType(
    fromDegree: _values * 200/180, 
    fromRadian: _values * 200/math.pi, 
    fromGradian: _values
    );
  }

  String _angleType({required num fromDegree,required num fromRadian,required num fromGradian}) {
    switch (_typeFrom) {
      case Angle.Degree: return fromDegree.toRound();
      case Angle.Radian: return fromRadian.toRound();
      case Angle.Gradian: return fromGradian.toRound();
      default:
      return '';
    }
  }

  late Angle _typeFrom;
  late num _values;

  String answer(String inputValue, Angle type1, Angle type2 ) {
  
    _typeFrom = type1;
    _values = num.parse(inputValue);

    switch (type2) {
      case Angle.Degree: return _toDegree();
      case Angle.Radian: return _toRadain();
      case Angle.Gradian: return _toGradian();
      default:
      return '';
    }
  }

} 