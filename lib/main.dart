import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wallnex/features/ads/presentation/provider/ad_provider.dart';
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/messaging/presentation/provider/messaging_provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/customization_provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/language_provider.dart';
import 'package:wallnex/features/profile/customization/presentation/provider/theme_provider.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import 'package:wallnex/wrapper.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'common/ui/navigation_bar/provider/get_default_home_page_notifier.dart';
import 'const/const.dart';
import 'core/config/l10n/generated/app_localizations.dart';
import 'core/config/router/routes.dart';
import 'core/config/theme/dark_theme.dart';
import 'core/config/theme/light_theme.dart';
import 'features/favorites/presentation/page/favorites.dart';
import 'features/favorites/presentation/provider/favorites_images_notifier.dart';
import 'features/file_manager/presentation/provider/file_manager_notifier.dart';
import 'features/permissions/presentation/provider/get_permission_status_notifier.dart';
import 'features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'features/profile/account_and_login/domain/entities/user.dart';
import 'features/profile/account_and_login/presentation/provider/local_user_provider.dart';
import 'features/profile/app_info/presentation/page/about.dart';
import 'features/profile/app_info/presentation/provider/get_app_info_notifier.dart';
import 'features/profile/customization/presentation/page/appearance/appearance_page.dart';
import 'features/profile/customization/presentation/page/customization/customization.dart';
import 'features/sorting/presentation/page/sorting_images_premium_only.dart';
import 'features/sorting/presentation/provider/sorting_provider.dart';
import 'features/subscription/presentation/page/purchase_wrapper.dart';
import 'features/subscription/presentation/provider/purchase_provider.dart';
import 'features/suggestions/presentation/page/suggestions.dart';
import 'features/suggestions/presentation/provider/get_suggestions_notifier.dart';
import 'injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initHive();
  di.initFirebase();
  di.initFlutterDownloader();
  di.initAds();
  di.initPlatformPurchasesState();
  di.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PurchaseProvider>(
          create: (_) =>
              di.getIt<PurchaseProvider>()..checkSubscriptionStatus(),
          child: const PurchasesAndSubscriptions(),
        ),
        ChangeNotifierProvider<GetPermissionNotifier>(
          create: (_) =>
              di.getIt<GetPermissionNotifier>()..getPermissionStatus(),
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
        ChangeNotifierProvider<FavoritesNotifier>(
          create: (_) => di.getIt<FavoritesNotifier>()..getFavorites(),
          child: const Favorites(),
        ),
        ChangeNotifierProvider<GetSuggestionsNotifier>(
          create: (_) => di.getIt<GetSuggestionsNotifier>(),
          child: const Suggestions(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => di.getIt<ThemeProvider>()..getThemeValue(),
          child: const AppearanceScreen(),
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => di.getIt<LanguageProvider>()..getLanguageValue(),
          child: const AppearanceScreen(),
        ),
        ChangeNotifierProvider<CustomizationProvider>(
          create: (_) => di.getIt<CustomizationProvider>()
            ..getNavBarStyle()
            ..getCrossAxisCount(),
          child: const Customization(),
        ),
        ChangeNotifierProvider<SetImageASWallpaperNotifier>(
          create: (_) => di.getIt<SetImageASWallpaperNotifier>(),
        ),
        ChangeNotifierProvider<GetSearchHistoryNotifier>(
          create: (_) => di.getIt<GetSearchHistoryNotifier>(),
        ),
        ChangeNotifierProvider<FileManagerNotifier>(
          create: (_) => di.getIt<FileManagerNotifier>(),
        ),
        ChangeNotifierProvider<DownloadProvider>(
          create: (_) => di.getIt<DownloadProvider>()..listenPort(),
        ),
        StreamProvider<LocalUser>(
          create: (_) => di.getIt<LocalUserProvider>().user,
          initialData: LocalUser.initialData(),
        ),
        ChangeNotifierProvider<AdProvider>(
          create: (_) => di.getIt<AdProvider>()..createBanner(),
        ),
        ChangeNotifierProvider<SortingProvider>(
          create: (_) => di.getIt<SortingProvider>(),
          child: const SortingImages(),
        ),
        ChangeNotifierProvider<LocalUserProvider>(
          create: (_) => di.getIt<LocalUserProvider>(),
        ),
        ChangeNotifierProvider<MessagingProvider>(
          create: (_) => di.getIt<MessagingProvider>(),
        ),
      ],
      child: const Wallnex(),
    );
  }
}

class Wallnex extends StatelessWidget {
  const Wallnex({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.select((ThemeProvider themeMode) => themeMode.value);
    final language = context.select((LanguageProvider locale) => locale.value);
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp.router(
        routeInformationProvider: AppRouter().router.routeInformationProvider,
        routeInformationParser: AppRouter().router.routeInformationParser,
        routerDelegate: AppRouter().router.routerDelegate,
        locale: language,
        localizationsDelegates: [
          L.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FirebaseUILocalizations.delegate,
        ],
        supportedLocales: L.supportedLocales,
        theme: AppTheme.lightTheme(lightDynamic!, context),
        darkTheme: AppDarkTheme.darkTheme(darkDynamic!, context),
        themeAnimationStyle: AnimationStyle(
            duration: kAnimationDuration,
            curve: Curves.easeIn,
            reverseCurve: Curves.bounceOut),
        themeMode: value == ThemeValue.light
            ? ThemeMode.light
            : value == ThemeValue.dark
                ? ThemeMode.dark
                : value == ThemeValue.auto
                    ? ThemeMode.system
                    : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
