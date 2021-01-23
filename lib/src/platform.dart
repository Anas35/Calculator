import 'package:flutter/services.dart';

class AndroidPlatform {
  
  static const platform = const MethodChannel('Anas.Calculator/appDir');

  static Future<String> appDir() async {
    try {
      final directory = await platform.invokeMethod('getAppDirPath');
      return directory;
    } on PlatformException catch (e) {
      throw e;
    }
  }

}