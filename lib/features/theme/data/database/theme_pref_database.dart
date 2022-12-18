import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

abstract class ThemePrefDatabase {
  Future<void> setTheme(int themeValue);
  Future<int> getTheme();
}

class ThemePrefDatabaseImpl implements ThemePrefDatabase {
  @override
  Future<int> getTheme() async {
    final themeBox = Hive.box('theme');
    if(themeBox.isEmpty){
      return 2;
    } else {
      return await themeBox.get('theme pref');
    }
  }

  @override
  Future<void> setTheme(int themeValue) async {
   final themeBox =  Hive.box('theme');
    await themeBox.put('theme pref', themeValue);
  }
}
