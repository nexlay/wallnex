import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import 'package:wallnex/wrapper.dart';
import 'package:wallnex/features/favorites/presentation/provider/get_favorites_images_notifier.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'common/provider/get_default_home_page_notifier.dart';
import 'core/config/theme/dark_theme.dart';
import 'core/config/theme/light_theme.dart';
import 'core/permissions/presentation/provider/get_permission_status_notifier.dart';
import 'features/favorites/presentation/page/favorites.dart';
import 'features/file_manager/presentation/provider/file_manager_notifier.dart';
import 'features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'features/profile/app_info/presentation/page/about/about.dart';
import 'features/profile/app_info/presentation/provider/get_app_info_notifier.dart';
import 'features/profile/customization/presentation/page/appearance/appearance.dart';
import 'features/profile/customization/presentation/provider/get_customization_notifier.dart';
import 'features/profile/customization/presentation/provider/get_theme_notifier.dart';
import 'features/suggestions/presentation/page/suggestions.dart';
import 'features/suggestions/presentation/provider/get_suggestions_notifier.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetPermissionNotifier>(
          create: (_) => di.sl<GetPermissionNotifier>()..getPermissionStatus(),
          child: const Warapper(),
        ),
        ChangeNotifierProvider<GetPages>(
          create: (_) => di.sl<GetPages>(),
          child: const Warapper(),
        ),
        ChangeNotifierProvider<GetImagesNotifier>(
          create: (_) => di.sl<GetImagesNotifier>()..loadImages(),
          child: const Warapper(),
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
        ChangeNotifierProvider<FileManagerNotifier>(
          create: (_) => di.sl<FileManagerNotifier>(),
        ),
        ChangeNotifierProvider<GetSearchHistoryNotifier>(
          create: (_) => di.sl<GetSearchHistoryNotifier>(),
        ),
        ChangeNotifierProvider(create: (_) => di.sl<DownloadProvider>()),
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppDarkTheme.darkTheme,
      themeMode: value == ThemeValue.light
          ? ThemeMode.light
          : value == ThemeValue.dark
              ? ThemeMode.dark
              : value == ThemeValue.auto
                  ? ThemeMode.system
                  : ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const Warapper(),
    );
  }
}
