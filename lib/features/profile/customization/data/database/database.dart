import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/language_provider.dart';
import '../../presentation/provider/theme_provider.dart';

abstract class CustomizationPrefDatabase {
  Future<void> setTheme(int themeValue);
  Future<int> getTheme();

  Future<void> setLanguage(String locale);
  Future<String> getLanguage();

  Future<void> setNavBarStyle(bool switcher);
  Future<bool> getNavBarStyle();

  Future<void> setCrossAxisCount(bool switcher);
  Future<bool> getCrossAxisCount();
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
  Future<String> getLanguage() async {
    final customization = await Hive.openBox('customization');
    if (!customization.containsKey('language pref')) {
      return AppLanguage.english.value;
    } else {
      return await customization.get('language pref');
    }
  }

  @override
  Future<void> setLanguage(String locale) async {
    final customization = Hive.box('customization');
    await customization.put('language pref', locale);
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

  @override
  Future<bool> getCrossAxisCount() async {
    final customization = await Hive.openBox('customization');
    if (!customization.containsKey('cross axis count')) {
      return false;
    } else {
      return await customization.get('cross axis count');
    }
  }

  @override
  Future<void> setCrossAxisCount(bool switcher) async {
    final customization = Hive.box('customization');
    return await customization.put('cross axis count', switcher);
  }
}
