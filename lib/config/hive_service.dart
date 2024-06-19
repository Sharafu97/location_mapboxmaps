import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';

class HiveServices {
  HiveServices._privateConstructor();

  static final HiveServices instance = HiveServices._privateConstructor();
  late Box<dynamic> box;

  Future<void> initHive() async {
    Hive.init(Directory.current.path);
    box = await Hive.openBox('local_api_res');
  }

  void saveString(String key, dynamic value) {
    String valueData;
    if (value is String) {
      valueData = value;
    } else {
      valueData = json.encode(value);
    }
    box.put(key, valueData);
  }

  String getString(String key) {
    return box.get(key);
  }

  Future<void> deleteString(String key) async {
    return await box.delete(key);
  }

  Future<void> clearAll() async {
    await Hive.box('local_api_res').clear();
  }
}
