import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../presentation/provider/theme_provider.dart';

abstract class CustomizationPrefDatabase {
  Future<void> setTheme(int themeValue);
  Future<int> getTheme();

  Future<void> setNavBarStyle(bool switcher);
  Future<bool> getNavBarStyle();
}

class CustomizationPrefDatabaseImpl implements CustomizationPrefDatabase {
  @override
  Future<int> getTheme() async {
    final customization = await Hive.openBox('customization');
    if (!customization.containsKey('theme pref')) {
      return ThemeValue.dark.value;
    } else {
      return await customization.get('theme pref');
    }
  }

  @override
  Future<void> setTheme(int themeValue) async {
    final customization = Hive.box('customization');
    await customization.put('theme pref', themeValue);
  }

  @override
  Future<bool> getNavBarStyle() async {
    final customization = await Hive.openBox('customization');
    if (!customization.containsKey('nav bar style')) {
      return false;
    } else {
      return await customization.get('nav bar style');
    }
  }

  @override
  Future<void> setNavBarStyle(bool switcher) async {
    final customization = Hive.box('customization');
    return await customization.put('nav bar style', switcher);
  }
}
