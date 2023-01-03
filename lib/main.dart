import 'package:wallnex/presentation/provider/get_cropped_image_notifier.dart';
import 'package:wallnex/wrapper.dart';
import 'package:wallnex/presentation/pages/account/about/about.dart';
import 'package:wallnex/presentation/pages/account/appearance/appearance.dart';
import 'package:wallnex/presentation/pages/favorites/favorites.dart';
import 'package:wallnex/presentation/pages/suggestions/suggestions.dart';
import 'package:wallnex/presentation/provider/get_app_info_notifier.dart';
import 'package:wallnex/presentation/provider/get_customizartion_notifier.dart';
import 'package:wallnex/presentation/provider/get_favorites_images_notifier.dart';
import 'package:wallnex/presentation/provider/get_suggestions_notifier.dart';
import 'package:wallnex/presentation/provider/get_theme_notifier.dart';
import 'package:wallnex/presentation/provider/get_images_notifier.dart';
import 'package:wallnex/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'core/config/theme/dark_theme.dart';
import 'core/config/theme/light_theme.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/provider/get_default_home_page_notifier.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetPages>(
          create: (_) => di.sl<GetPages>(),
          child: const Home(),
        ),
        ChangeNotifierProvider<GetImagesNotifier>(
          create: (_) => di.sl<GetImagesNotifier>()..loadAllWallpapers(),
          child: const Home(),
        ),
        ChangeNotifierProvider<GetAppInfoNotifier>(
          create: (_) => di.sl<GetAppInfoNotifier>()..loadAppInfo(),
          child: const AppInformation(),
        ),
        ChangeNotifierProvider<GetFavoritesNotifier>(
          create: (_) =>
              di.sl<GetFavoritesNotifier>()..loadFavoritesWallpapers(),
          child: const Favorites(),
        ),
        ChangeNotifierProvider<GetSuggestionsNotifier>(
          create: (_) => di.sl<GetSuggestionsNotifier>(),
          child: const Suggestions(),
        ),
        ChangeNotifierProvider<GetThemeNotifier>(
          create: (_) => di.sl<GetThemeNotifier>()..getThemeValue(),
          child: const Appearance(),
        ),
        ChangeNotifierProvider<GetCustomization>(
          create: (_) => di.sl<GetCustomization>()..getNavBarStyle(),
          child: const Appearance(),
        ),
        ChangeNotifierProvider<SetImageASWallpaperNotifier>(
          create: (_) => di.sl<SetImageASWallpaperNotifier>(),
        ),
        ChangeNotifierProvider<GetCroppedImageNotifier>(
            create: (_) => di.sl<GetCroppedImageNotifier>()),
      ],
      child: const Wallnex(),
    );
  }
}

class Wallnex extends StatelessWidget {
  const Wallnex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value =
        context.select((GetThemeNotifier themeMode) => themeMode.value);
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: value == 1
          ? ThemeMode.light
          : value == 2
              ? ThemeMode.dark
              : value == 0
                  ? ThemeMode.system
                  : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
