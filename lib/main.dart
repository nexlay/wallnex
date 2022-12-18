import 'package:wallnex/presentation/common/navigation_bar/navigation_bar.dart';
import 'package:wallnex/presentation/common/theme/dark_theme.dart';
import 'package:wallnex/presentation/pages/account_page/about/about.dart';
import 'package:wallnex/presentation/pages/favorites_page/favorite_page.dart';
import 'package:wallnex/presentation/pages/home_page/home_page.dart';
import 'package:wallnex/presentation/pages/image_detail_and_suggestions_page/widgets/suggestions/suggestions.dart';
import 'package:wallnex/presentation/provider/get_app_info_notifier.dart';
import 'package:wallnex/presentation/provider/get_favorites_wallpapers_notifier.dart';
import 'package:wallnex/presentation/provider/get_suggestions_notifier.dart';
import 'package:wallnex/presentation/provider/get_theme_notifier.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_from_api_notifier.dart';
import 'package:wallnex/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/theme/light_theme.dart';
import 'package:wallnex/presentation/provider/get_navBar_page_notifier.dart';

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
        ),
        ChangeNotifierProvider<GetWallpapersNotifier>(
          create: (_) => di.sl<GetWallpapersNotifier>(),
          child: const WallnexHomePage(),
        ),
        ChangeNotifierProvider<GetAppInfoNotifier>(
          create: (_) => di.sl<GetAppInfoNotifier>(),
          child: const WelcomeWallnexPage(),
        ),
        ChangeNotifierProvider<GetFavoritesNotifier>(
          create: (_) => di.sl<GetFavoritesNotifier>(),
          child: const FavoritePage(),
        ),
        ChangeNotifierProvider<GetSuggestionsNotifier>(
          create: (_) => di.sl<GetSuggestionsNotifier>(),
          child: const Suggestions(),
        ),
        ChangeNotifierProvider<GetThemeNotifier>(
          create: (_) => di.sl<GetThemeNotifier>(),
        ),
        ChangeNotifierProvider<SetImageASWallpaperNotifier>(
          create: (_) => di.sl<SetImageASWallpaperNotifier>(),
        ),
      ],
      child: const Wallnex(),
    );
  }
}

class Wallnex extends StatelessWidget {
  const Wallnex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeValue = context.select((GetThemeNotifier t) => t.value);
    // **  Run your code after the widget has finished building.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<GetThemeNotifier>().getThemeValue();
        context.read<GetWallpapersNotifier>().loadAllWallpapers();
        context.read<GetThemeNotifier>().checkThemeMode();
      },
    );

    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: themeValue == 1
          ? ThemeMode.light
          : themeValue == 2
              ? ThemeMode.dark
              : themeValue == 0
                  ? ThemeMode.system
                  : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const WallnexNavBar(),
    );
  }
}
