import 'package:wallnex/presentation/common/theme/dark_theme.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_notifier.dart';
import 'package:wallnex/presentation/provider/set_wallpaper_notifier.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/presentation/common/navigationbar/custom_nav_bar.dart';
import 'package:wallnex/presentation/common/theme/light_theme.dart';
import 'package:wallnex/presentation/provider/home_page_pref_notifier.dart';

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
        ChangeNotifierProvider<Pages>(
          create: (_) => di.sl<Pages>(),
        ),
        ChangeNotifierProvider<GetWallpapersNotifier>(
          create: (_) => di.sl<GetWallpapersNotifier>(),
        ),
        ChangeNotifierProvider<SetWallpaperNotifier>(
          create: (_) => di.sl<SetWallpaperNotifier>(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppDarkTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const CustomNavBar(),
      ),
    );
  }
}
