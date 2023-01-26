import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wallnex/features/favorites/domain/usecase/get_favorite_wallpapers_use_case.dart';
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/suggestions/data/repository/suggestion_repo_impl.dart';
import 'package:wallnex/features/suggestions/domain/usecase/get_suggestions_usecase.dart';
import 'package:wallnex/features/images/domain/usecases/get_tags_uploader_use_case.dart';
import 'package:wallnex/features/search/data/database/database.dart';
import 'package:wallnex/features/search/data/repository/repository_impl.dart';
import 'package:wallnex/features/search/domain/repository/repository.dart';
import 'package:wallnex/features/search/domain/usecases/get_search_history.dart';
import 'package:wallnex/features/search/domain/usecases/push_search_history_into_db.dart';
import 'package:wallnex/features/favorites/presentation/provider/get_favorites_images_notifier.dart';
import 'package:wallnex/features/search/presentation/provider/get_search_history_notifier.dart';
import 'package:wallnex/features/images/presentation/provider/get_images_notifier.dart';
import 'common/provider/get_default_home_page_notifier.dart';
import 'core/permissions/data/datasource/datasource.dart';
import 'core/permissions/data/repository/permission_repo_impl.dart';
import 'core/permissions/domain/repo/permission_repo.dart';
import 'core/permissions/domain/usecase/get_permission_status_use_case.dart';
import 'core/permissions/presentation/provider/get_permission_status_notifier.dart';
import 'features/favorites/data/data/favorites_database.dart';
import 'features/favorites/data/repository/favorites_repo_impl.dart';
import 'features/favorites/domain/repository/favorites_repo.dart';
import 'features/images/data/datasource/database.dart';
import 'features/images/data/repositories/repositories_impl.dart';
import 'features/images/domain/entities/wallpaper.dart';
import 'features/images/domain/repository/image_repo.dart';
import 'features/images/domain/usecases/get_image_use_case.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'features/file_manager/presentation/provider/file_manager_notifier.dart';
import 'features/preview/data/data/data.dart';
import 'features/preview/data/wallpaper_repo_impl/wallpaper_repo_impl.dart';
import 'features/preview/domain/repository/wallpaper_repo.dart';
import 'features/preview/domain/usecase/set_image_as_wallpaper_use_case.dart';
import 'features/preview/presentation/provider/set_image_as_wallpaper_notifier.dart';
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
import 'features/profile/customization/presentation/provider/get_customization_notifier.dart';
import 'features/profile/customization/presentation/provider/get_theme_notifier.dart';
import 'features/suggestions/data/data/suggestions_data.dart';
import 'features/suggestions/domain/repository/suggestions_repo.dart';
import 'features/suggestions/presentation/provider/get_suggestions_notifier.dart';

final sl = GetIt.instance;

Future<void> init() async {


  Hive.registerAdapter(
    WallpaperAdapter(),
  );
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

//Notifiers
  sl.registerFactory(
    () => GetPermissionNotifier(
      getPermissionUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => GetSearchHistoryNotifier(
      pushSearchHistoryIntoDb: sl(),
      getSearchHistoryUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => FileManagerNotifier(),
  );
  sl.registerFactory(
    () => DownloadProvider(),
  );

  sl.registerFactory(
    () => GetImagesNotifier(
      getWallpaperUseCase: sl(),
      getSingleWallpaperUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GetAppInfoNotifier(
      getAppInfoUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GetFavoritesNotifier(
      getFavoriteWallpapers: sl(),
    ),
  );

  sl.registerFactory(
    () => GetSuggestionsNotifier(
      getSuggestionsUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GetThemeNotifier(
      getThemeUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GetCustomization(
      getNavBarUseCase: sl(),
    ),
  );

  sl.registerFactory(
    () => GetPages(),
  );

  sl.registerFactory(
    () => SetImageASWallpaperNotifier(
      setImageAsWallpaperUseCase: sl(),
    ),
  );

  //Domain layer

  sl.registerFactory(
    () => GetPermissionUseCase(
      permissionRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => PushSearchHistoryIntoDb(
      searchRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetSearchHistoryUseCase(
      searchRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetImageUseCase(
      imageRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => GetTagsAndUploaderUseCase(
      imageRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => GetFavoriteWallpapersUseCase(
      favoriteWallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetSuggestionsUseCase(
      suggestionsRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetAppInfoUseCase(
      appInfoRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => GetThemeUseCase(
      themeRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => GetNavBarUseCase(
      customizationRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => SetImageAsWallpaperUseCase(
      wallpaperRepo: sl(),
    ),
  );

  //Repo

  sl.registerLazySingleton<PermissionRepo>(
    () => PermissionRepoImpl(
      permissionData: sl(),
    ),
  );

  sl.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(
      searchDatabase: sl(),
    ),
  );

  sl.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(
      imageDatabase: sl(),
    ),
  );

  sl.registerLazySingleton<AppInfoRepo>(
    () => AppInfoRepositoriesImpl(
      packageInfoPlus: sl(),
    ),
  );

  sl.registerLazySingleton<CustomizationRepo>(
    () => CustomizationRepoImpl(
      hiveDatabase: sl(),
    ),
  );

  sl.registerLazySingleton<SuggestionsRepo>(
    () => SuggestionsRepoImpl(
      suggestionsData: sl(),
    ),
  );
  sl.registerLazySingleton<WallpaperRepo>(
    () => WallpaperRepoImpl(
      wallpaperDatabase: sl(),
    ),
  );
  sl.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(
      favoritesDatabase: sl(),
    ),
  );

  //Data

  sl.registerFactory<SuggestionsData>(
    () => SuggestionsDataImpl(),
  );
  sl.registerFactory<SetImageAsWallpaper>(
    () => SetImageAsWallpaperImpl(),
  );
  sl.registerFactory<FavoritesDatabase>(
    () => FavoritesDatabaseImpl(),
  );
  sl.registerFactory<PermissionData>(
    () => PermissionDataImpl(),
  );

  sl.registerFactory<SearchDatabase>(
    () => SearchDatabaseImpl(),
  );

  sl.registerFactory<ImageDatabase>(
    () => ImageDatabaseImpl(),
  );

  //App info package source
  sl.registerFactory<PackageInfoPlus>(
    () => PackageInfoPlusImpl(),
  );

  //Hive database
  sl.registerFactory<CustomizationPrefDatabase>(
    () => CustomizationPrefDatabaseImpl(),
  );
}
