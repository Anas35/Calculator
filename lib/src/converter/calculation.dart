import 'package:calculator/src/converter/type.dart';
import 'package:calculator/extension.dart';

class Calculation {

  static final Map<Type,Map<dynamic,num>> _convert = {
  /*  Voulme: {
      Voulme.Milliliters: ,
      Voulme.Cubic_centimeters: ,
      Voulme.Liters: ,
      Voulme.Cubic_meters: ,
      Voulme.Teaspoons: ,
      Voulme.Tablespoons: ,
      Voulme.Fluid_ounces: ,
      Voulme.Cups: ,
      Voulme.Pints: ,
      Voulme.Quarts: ,
      Voulme.Gallons: ,
      Voulme.Cubic_inches: ,
      Voulme.Cubic_feet: ,
      Voulme.Cubic_yards: ,
    },*/
    Length: {
      Length.Nanometers: 1,
      Length.Microns: 1000,
      Length.Millimeters: 1e+6,
      Length.Centimeter: 1e+7,
      Length.Meters: 1e+9,
      Length.Kilometers: 1e+12,
      Length.Inches: 2.54e+7,
      Length.Feet: 3.048e+8,
      Length.Yards: 9.144e+8,
      Length.Miles: 1.609344e+12,
      Length.Nautical_Miles: 1.852e+12,
    },
    Weight_and_Mass: {
      Weight_and_Mass.Carats: 1,
      Weight_and_Mass.Milligrams: 0.005,
      Weight_and_Mass.Centigrams: 0.05,
      Weight_and_Mass.Decigrams: 0.5,
      Weight_and_Mass.Grams: 5,
      Weight_and_Mass.Dekagrams: 50,
      Weight_and_Mass.Hectograms: 500,
      Weight_and_Mass.Kilograms: 5000,
      Weight_and_Mass.Metric_tonnes: 5e+6,
      Weight_and_Mass.Ounces: 141.7476,
      Weight_and_Mass.Pounds: 2267.962,
      Weight_and_Mass.Stone: 31751.47,
    },
    Energy: {
      ///TODO: to check value is correct
      Energy.Electron_volts: 1,
      Energy.Joules: 6.242e+18,
      Energy.KiloJoules: 9.223e+18,
      Energy.Thermal_calories: 9.223e+18,
      Energy.Food_calores: 9.223e+18,
      Energy.Foot_pounds: 8.462e+18,
    },
    Area: {
      Area.Squrae_millimeters: 1,
      Area.Squrae_centimeters: 100,
      Area.Squrae_meters: 1e+6,
      Area.Hectares: 1e+10,
      Area.Squrae_kilometers: 1e+12,
      Area.Squrae_inches: 645,
      Area.Squrae_feets: 92903,
      Area.Square_yards: 836127,
      Area.Acres: 4.047e+9,
      Area.Square_miles: 2.59e+12,
    },
    Speed: {
      Speed.Centimeters_per_second: 1,
      Speed.Meters_per_second: 100,
      Speed.Kilometers_per_hour: 27.778,
      Speed.Feet_per_second: 30.48,
      Speed.Miles_per_hour: 44.704,
      Speed.Knots: 51.444,
    },
    /*Time: {
      Time.Microseconds: ,
      Time.Milliseconds: ,
      Time.Seconds: ,
      Time.Minutes: ,
      Time.Hour: ,
      Time.Days: ,
      Time.Weeks: ,
      Time.Years: ,
    },
    Power: {
      Power.Watts: ,
      Power.Kilowatts: ,
      Power.Horspower: ,
      Power.Foot_pounds_by_minute: ,
      Power.BTUs_by_minute: ,
    },*/
    Pressure: {
      Pressure.Atmospheres: 101325,
      Pressure.Bars: 100000,
      Pressure.Pascals: 1,
      Pressure.Pounds_per_square_inch: 6895,
      Pressure.Torr: 133,
    },
    Angle: {
      Angle.Degrees: 1,
      Angle.Radians: 57.29578,
      Angle.Gradians: 0.9,
    },
  };

  static String answer<T>(String inputValue, T typeFrom, T typeTo) {
    print(T);
    Map<dynamic,num> con = _convert[T] ?? {};
   
    num type1 = con[typeFrom] ?? 0;
    num type2 = con[typeTo] ?? 0;
    
    num value = num.parse(inputValue);

    num answer = value/type2 * type1;

    return answer.toRound();
  }
}