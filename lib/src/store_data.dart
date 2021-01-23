import 'dart:io';
import 'package:calculator/src/platform.dart';

class StoreData {

  Future<File> get _createFile async {
    final String path = await AndroidPlatform.appDir();
    return File('$path/counter.txt');
  }

  Future<File>  set(bool value) async {
  final file = await _createFile;
  // Write the file.
   return file.writeAsString(value.toString());
  }

  Future<bool> get value async {
  try {
    final file = await _createFile;
    String contents = await file.readAsString();

    return contents.toLowerCase() == 'true' ? true : false;
  } catch (e) {
    throw e;
  }
}

}