import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:wallnex/core/config/env/env.dart';
import 'package:wallnex/features/ads/data/datasource/datasource.dart';
import 'package:wallnex/features/ads/data/repository/repo_impl.dart';
import 'package:wallnex/features/ads/domain/repo/repository.dart';
import 'package:wallnex/features/ads/domain/usecase/create_banner_ad_use_case.dart';
import 'package:wallnex/features/ads/presentation/provider/ad_provider.dart';
import 'package:wallnex/features/favorites/data/data/remote_database.dart';
import 'package:wallnex/features/favorites/data/data/sync.dart';
import 'package:wallnex/features/favorites/domain/usecase/delete_from_firestore.dart';
import 'package:wallnex/features/favorites/domain/usecase/delete_from_local_db.dart';
import 'package:wallnex/features/favorites/domain/usecase/get_favorites.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/profile/account_and_login/data/database/firebase_db.dart';
import 'package:wallnex/features/profile/account_and_login/data/repo/repository_impl.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';
import 'package:wallnex/features/profile/customization/domain/usecase/get_crossAxisCount_usecase.dart';
import 'package:wallnex/features/profile/customization/domain/usecase/set_crossAxisCount_usecase.dart';
import 'package:wallnex/features/profile/customization/domain/usecase/set_custom_nav_bar_use_case.dart';
import 'package:wallnex/features/profile/customization/domain/usecase/set_theme_usecase.dart';
import 'package:wallnex/features/suggestions/data/repository/suggestion_repo_impl.dart';
import 'package:wallnex/features/suggestions/domain/usecase/get_suggestions_usecase.dart';
import 'package:wallnex/features/images/domain/usecases/get_tags_uploader_use_case.dart';
import 'package:wallnex/features/search/data/database/database.dart';
import 'package:wallnex/features/search/data/repository/repository_impl.dart';
import 'package:wallnex/features/search/domain/repository/repository.dart';
import 'package:wallnex/features/search/domain/usecases/get_search_history.dart';
import 'package:wallnex/features/search/domain/usecases/push_search_history_into_db.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'common/ui/navigation_bar/provider/get_default_home_page_notifier.dart';
import 'features/favorites/data/data/local_database.dart';
import 'features/favorites/data/repository/favorites_repo_impl.dart';
import 'features/favorites/domain/repository/favorites_repo.dart';
import 'features/favorites/domain/usecase/add_to_firestore.dart';
import 'features/favorites/domain/usecase/add_to_local_db_use_case.dart';
import 'features/favorites/presentation/provider/favorites_images_notifier.dart';
import 'features/images/data/datasource/database.dart';
import 'features/images/data/repositories/repositories_impl.dart';
import 'features/images/domain/entities/wallpaper.dart';
import 'features/images/domain/repository/image_repo.dart';
import 'features/images/domain/usecases/get_image_use_case.dart';
import 'features/file_manager/presentation/provider/file_manager_notifier.dart';
import 'features/permissions/data/datasource/datasource.dart';
import 'features/permissions/data/repository/permission_repo_impl.dart';
import 'features/permissions/domain/repo/permission_repo.dart';
import 'features/permissions/domain/usecase/get_permission_status_use_case.dart';
import 'features/permissions/presentation/provider/get_permission_status_notifier.dart';
import 'features/preview/data/data/data.dart';
import 'features/preview/data/repo_impl/wallpaper_repo_impl.dart';
import 'features/preview/domain/repository/wallpaper_repo.dart';
import 'features/preview/domain/usecase/set_image_as_wallpaper_use_case.dart';
import 'features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'features/profile/account_and_login/domain/usecase/delete_all_user_data.dart';
import 'features/profile/account_and_login/domain/usecase/get_local_user.dart';
import 'features/profile/account_and_login/domain/usecase/update_profile_photo_url.dart';
import 'features/profile/account_and_login/presentation/provider/local_user_provider.dart';
import 'features/profile/app_info/data/datasource/package_info.dart';
import 'features/profile/app_info/data/repositories/repositories_app_info_impl.dart';
import 'features/profile/app_info/domain/repository/appInfo_repo.dart';
import 'features/profile/app_info/domain/usecases/get_app_info_usecase.dart';
import 'features/profile/app_info/presentation/provider/get_app_info_notifier.dart';
import 'features/profile/customization/data/customization_repo_impl/customization_repo_impl.dart';
import 'features/profile/customization/data/database/database.dart';
import 'features/profile/customization/domain/repo/customization_repo.dart';
import 'features/profile/customization/domain/usecase/get_nav_bar_usecase.dart';
import 'features/profile/customization/domain/usecase/get_theme_usecase.dart';
import 'features/profile/customization/presentation/provider/customization_provider.dart';
import 'features/profile/customization/presentation/provider/theme_provider.dart';
import 'features/subscription/data/datasource/purchase_datasource.dart';
import 'features/subscription/data/repo/purchase_repo_impl.dart';
import 'features/subscription/domain/repo/purchase_repo.dart';
import 'features/subscription/domain/usecase/check_subscription_status.dart';
import 'features/subscription/domain/usecase/fetch_products_use_case.dart';
import 'features/subscription/domain/usecase/purchase_product_use_case.dart';
import 'features/subscription/presentation/provider/purchase_provider.dart';
import 'features/suggestions/data/data/suggestions_data.dart';
import 'features/suggestions/domain/repository/suggestions_repo.dart';
import 'features/suggestions/presentation/provider/get_suggestions_notifier.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'firebase_options.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
}

Future<void> initHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(
    WallpaperAdapter(),
  );
}

Future<void> initFlutterDownloader() async {
  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
}

void initAds() {
  MobileAds.instance.initialize();

  //TODO: Delete this on release app
  RequestConfiguration configuration =
  RequestConfiguration(testDeviceIds: ["43978BE68FF3A452E889AE0827D2DD77"]);
  MobileAds.instance.updateRequestConfiguration(configuration);
}

Future<void> initPlatformPurchasesState() async {
  //Purchases.setLogLevel(LogLevel.debug);

  final PurchasesConfiguration configuration =
      PurchasesConfiguration(Env.googleApiPurchaseKey);

  await Purchases.configure(configuration);
}

final getIt = GetIt.instance;

Future<void> init() async {
//-----------------------------
//Providers (ChangeNotifiers)
//-----------------------------
  getIt.registerFactory(
    () => PurchaseProvider(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => AdProvider(
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => LocalUserProvider(
      getIt(),
      getIt(),
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => GetPermissionNotifier(
      getPermissionUseCase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => GetSearchHistoryNotifier(
      pushSearchHistoryIntoDb: getIt(),
      getSearchHistoryUseCase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => FileManagerNotifier(),
  );
//-----------------------------
  getIt.registerFactory(
    () => DownloadProvider(),
  );
//-----------------------------
  getIt.registerFactory(
    () => GetImagesNotifier(
      getWallpaperUseCase: getIt(),
      getSingleWallpaperUseCase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => GetAppInfoNotifier(
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => FavoritesNotifier(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => GetSuggestionsNotifier(
      getSuggestionsUseCase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => ThemeProvider(
      getIt(),
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => CustomizationProvider(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
//-----------------------------
  getIt.registerFactory(
    () => GetPages(),
  );
//-----------------------------
  getIt.registerFactory(
    () => SetImageASWallpaperNotifier(
      getIt(),
    ),
  );
//-----------------------------
  //Domain layer
  // -----------------------------
  getIt.registerLazySingleton(
        () => CheckSubscriptionStatus(
      repository: getIt(),
    ),
  );
  // -----------------------------
  getIt.registerLazySingleton(
    () => PurchaseProduct(
      repository: getIt(),
    ),
  );
  // -----------------------------
  getIt.registerLazySingleton(
    () => FetchProducts(
      repository: getIt(),
    ),
  );
  // -----------------------------
  getIt.registerLazySingleton(
    () => CreateBannerAdUseCase(
      adRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetUserUseCase(
      userRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => UpdateProfilePhotoUrlUseCase(
      userRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => DeleteAllUserDataUseCase(
      userRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetPermissionUseCase(
      permissionRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => PushSearchHistoryIntoDb(
      searchRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetSearchHistoryUseCase(
      searchRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetImageUseCase(
      imageRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetTagsAndUploaderUseCase(
      imageRepo: getIt(),
    ),
  );

//-----------------------------
  getIt.registerLazySingleton(
    () => AddToFireStoreUseCase(
      favoritesRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => DeleteFromFireStoreUseCase(
      favoritesRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetFavorites(
      favoritesRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => AddToLocalDbUseCase(
      favoritesRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => DeleteFromLocalDbUseCase(
      favoritesRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetSuggestionsUseCase(
      suggestionsRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetAppInfoUseCase(
      appInfoRepo: getIt(),
    ),
  );
//-----------------------------
  //Theme
  getIt.registerLazySingleton(
    () => GetThemeUseCase(
      themeRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => SetThemeUseCase(
      themeRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => GetNavBarUseCase(
      customizationRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => SetNavBarUseCase(
      customizationRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
        () => GetCrossAxisCount(
      customizationRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
        () => SetCrossAxisCount(
      customizationRepo: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton(
    () => SetImageAsWallpaperUseCase(
      wallpaperRepo: getIt(),
    ),
  );
//-----------------------------
  //Repository
//-----------------------------
  getIt.registerLazySingleton<PurchaseRepository>(
    () => PurchaseRepositoryImpl(
      purchaseDataSource: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<AdRepo>(
    () => AdRepoImpl(
      bannerAdDatasource: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<UserRepo>(
    () => FirebaseRepoImpl(
      firebaseDb: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<PermissionRepo>(
    () => PermissionRepoImpl(
      permissionData: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(
      searchDatabase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(
      imageDatabase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<AppInfoRepo>(
    () => AppInfoRepositoriesImpl(
      packageInfoPlus: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<CustomizationRepo>(
    () => CustomizationRepoImpl(
      hiveDatabase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<SuggestionsRepo>(
    () => SuggestionsRepoImpl(
      suggestionsData: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<WallpaperRepo>(
    () => WallpaperRepoImpl(
      wallpaperDatabase: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(
      localDb: getIt(),
      remoteDb: getIt(),
      syncDatabases: getIt(),
    ),
  );
//-----------------------------
  //Data
//-----------------------------
  getIt.registerLazySingleton<PurchaseDataSource>(
    () => PurchaseDataSourceImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<BannerAdDatasource>(
    () => BannerAdDataSourceImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<SyncDatabases>(
    () => SyncDatabaseImpl(
      local: getIt(),
      remote: getIt(),
    ),
  );
//-----------------------------
  getIt.registerLazySingleton<FirebaseAuthDb>(
    () => FirebaseAuthDbImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<SuggestionsData>(
    () => SuggestionsDataImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<SetImageAsWallpaper>(
    () => SetImageAsWallpaperImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<LocalDb>(
    () => FavoritesDatabaseImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<RemoteDb>(
    () => FavoritesFirebaseDbImpl(getIt()),
  );
//-----------------------------
  getIt.registerLazySingleton<PermissionData>(
    () => PermissionDataImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<SearchDatabase>(
    () => SearchDatabaseImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<ImageDatabase>(
    () => ImageDatabaseImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<PackageInfoPlus>(
    () => PackageInfoPlusImpl(),
  );
//-----------------------------
  getIt.registerLazySingleton<CustomizationPrefDatabase>(
    () => CustomizationPrefDatabaseImpl(),
  );
}
