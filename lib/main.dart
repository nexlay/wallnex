import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import 'package:wallnex/firebase_options.dart';
import 'package:wallnex/wrapper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'common/provider/get_default_home_page_notifier.dart';
import 'core/config/router/routes.dart';
import 'core/config/theme/dark_theme.dart';
import 'core/config/theme/light_theme.dart';
import 'features/favorites/presentation/page/favorites.dart';
import 'features/favorites/presentation/provider/favorites_images_notifier.dart';
import 'features/file_manager/presentation/provider/file_manager_notifier.dart';
import 'features/permissions/presentation/provider/get_permission_status_notifier.dart';
import 'features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'features/profile/account_and_login/domain/entities/user.dart';
import 'features/profile/account_and_login/presentation/provider/user_auth_change_notifier.dart';
import 'features/profile/app_info/presentation/page/about.dart';
import 'features/profile/app_info/presentation/provider/get_app_info_notifier.dart';
import 'features/profile/customization/presentation/page/appearance/appearance.dart';
import 'features/profile/customization/presentation/provider/get_customization_notifier.dart';
import 'features/profile/customization/presentation/provider/get_theme_notifier.dart';
import 'features/profile/profile_page.dart';
import 'features/suggestions/presentation/page/suggestions.dart';
import 'features/suggestions/presentation/provider/get_suggestions_notifier.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  //Init hive Hive database
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
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
          create: (_) =>
              di.getIt<GetPermissionNotifier>()..getPermissionStatus(),
          child: const Wrapper(),
        ),
        ChangeNotifierProvider<GetPages>(
          create: (_) => di.getIt<GetPages>(),
          child: const Wrapper(),
        ),
        ChangeNotifierProvider<GetImagesNotifier>(
          create: (_) => di.getIt<GetImagesNotifier>()..loadImages(),
          child: const Wrapper(),
        ),
        ChangeNotifierProvider<GetAppInfoNotifier>(
          create: (_) => di.getIt<GetAppInfoNotifier>()..loadAppInfo(),
          child: const AppInformation(),
        ),
        ChangeNotifierProvider<GetFavoritesNotifier>(
          create: (_) => di.getIt<GetFavoritesNotifier>()
            ..loadFavoritesWallpapers(),
          child: const Favorites(),
        ),
        ChangeNotifierProvider<GetSuggestionsNotifier>(
          create: (_) => di.getIt<GetSuggestionsNotifier>(),
          child: const Suggestions(),
        ),
        ChangeNotifierProvider<GetThemeNotifier>(
          create: (_) => di.getIt<GetThemeNotifier>()..getThemeValue(),
          child: const Appearance(),
        ),
        ChangeNotifierProvider<GetCustomization>(
          create: (_) => di.getIt<GetCustomization>()..getNavBarStyle(),
          child: const Appearance(),
        ),
        ChangeNotifierProvider<SetImageASWallpaperNotifier>(
          create: (_) => di.getIt<SetImageASWallpaperNotifier>(),
        ),
        ChangeNotifierProvider<FileManagerNotifier>(
          create: (_) => di.getIt<FileManagerNotifier>(),
        ),
        ChangeNotifierProvider<GetSearchHistoryNotifier>(
          create: (_) => di.getIt<GetSearchHistoryNotifier>(),
        ),
        ChangeNotifierProvider<DownloadProvider>(
          create: (_) => di.getIt<DownloadProvider>()
            ..registerIsolate()
            ..listenPort(),
        ),
        StreamProvider<LocalUser>(
          create: (_) => di.getIt<UserAuthChangeNotifier>().user,
          initialData: LocalUser.initialData(),
          child: const Profile(),
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

    final value =
        context.select((GetThemeNotifier themeMode) => themeMode.value);
    return MaterialApp.router(
      routeInformationProvider:   AppRouter().router.routeInformationProvider,
      routeInformationParser: AppRouter().router.routeInformationParser,
      routerDelegate: AppRouter().router.routerDelegate,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
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

    );
  }
}
