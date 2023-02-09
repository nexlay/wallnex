import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wallnex/features/favorites/data/data/remote_database.dart';
import 'package:wallnex/features/favorites/data/data/sync.dart';
import 'package:wallnex/features/favorites/domain/usecase/delete_from_firestore.dart';
import 'package:wallnex/features/file_manager/presentation/provider/download_provider.dart';
import 'package:wallnex/features/profile/account_and_login/data/database/firebase_db.dart';
import 'package:wallnex/features/profile/account_and_login/data/repo/repository_impl.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';
import 'package:wallnex/features/profile/account_and_login/domain/usecase/get_profile_photo_url_use_case.dart';
import 'package:wallnex/features/profile/account_and_login/domain/usecase/get_user_use_case.dart';
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
import 'common/provider/get_default_home_page_notifier.dart';
import 'features/favorites/data/data/local_database.dart';
import 'features/favorites/data/repository/favorites_repo_impl.dart';
import 'features/favorites/domain/repository/favorites_repo.dart';
import 'features/favorites/domain/usecase/add_to_firestore.dart';
import 'features/favorites/domain/usecase/add_update_delete_localDb_use_case.dart';
import 'features/favorites/domain/usecase/get_favorites_use_case.dart';
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
import 'features/profile/account_and_login/presentation/provider/user_auth_change_notifier.dart';
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

final getIt = GetIt.instance;

Future<void> init() async {
  Hive.registerAdapter(
    WallpaperAdapter(),
  );

//Notifiers

  getIt.registerFactory(
    () => UserAuthChangeNotifier(
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => GetPermissionNotifier(
      getPermissionUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => GetSearchHistoryNotifier(
      pushSearchHistoryIntoDb: getIt(),
      getSearchHistoryUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => FileManagerNotifier(),
  );
  getIt.registerFactory(
    () => DownloadProvider(),
  );

  getIt.registerFactory(
    () => GetImagesNotifier(
      getWallpaperUseCase: getIt(),
      getSingleWallpaperUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetAppInfoNotifier(
      getIt(),
    ),
  );
  getIt.registerFactory(
    () => GetFavoritesNotifier(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => GetSuggestionsNotifier(
      getSuggestionsUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => GetThemeNotifier(
      getThemeUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetCustomization(
      getNavBarUseCase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => GetPages(),
  );

  getIt.registerLazySingleton(
    () => SetImageASWallpaperNotifier(
      getIt(),
    ),
  );

  //Domain layer
  getIt.registerLazySingleton(
    () => GetUserUseCase(
      firebaseRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => UpdateProfilePhotoUrlUseCase(
      firebaseRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetPermissionUseCase(
      permissionRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => PushSearchHistoryIntoDb(
      searchRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetSearchHistoryUseCase(
      searchRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetImageUseCase(
      imageRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetTagsAndUploaderUseCase(
      imageRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AddDeleteUpdateUseCase(
      favoriteWallpaperRepo: getIt(),
    ),
  );
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

  getIt.registerLazySingleton(
    () => GetFavoritesUseCase(
      favoritesRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetSuggestionsUseCase(
      suggestionsRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton(
    () => GetAppInfoUseCase(
      appInfoRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetThemeUseCase(
      themeRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetNavBarUseCase(
      customizationRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => SetImageAsWallpaperUseCase(
      wallpaperRepo: getIt(),
    ),
  );

  //Repo
  getIt.registerLazySingleton<FirebaseRepo>(
    () => FirebaseRepoImpl(
      firebaseDb: getIt(),
    ),
  );

  getIt.registerLazySingleton<PermissionRepo>(
    () => PermissionRepoImpl(
      permissionData: getIt(),
    ),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(
      searchDatabase: getIt(),
    ),
  );

  getIt.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(
      imageDatabase: getIt(),
    ),
  );

  getIt.registerLazySingleton<AppInfoRepo>(
    () => AppInfoRepositoriesImpl(
      packageInfoPlus: getIt(),
    ),
  );

  getIt.registerLazySingleton<CustomizationRepo>(
    () => CustomizationRepoImpl(
      hiveDatabase: getIt(),
    ),
  );

  getIt.registerLazySingleton<SuggestionsRepo>(
    () => SuggestionsRepoImpl(
      suggestionsData: getIt(),
    ),
  );
  getIt.registerLazySingleton<WallpaperRepo>(
    () => WallpaperRepoImpl(
      wallpaperDatabase: getIt(),
    ),
  );
  getIt.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepoImpl(
      localDb: getIt(),
      remoteDb: getIt(),
      syncDatabases: getIt(),
    ),
  );

  //Data
  getIt.registerFactory<SyncDatabases>(
    () => SyncDatabaseImpl(
      getIt(),
      getIt(),
    ),
  );

  getIt.registerFactory<FirebaseAuthDb>(
    () => FirebaseAuthDbImpl(),
  );

  getIt.registerFactory<SuggestionsData>(
    () => SuggestionsDataImpl(),
  );
  getIt.registerFactory<SetImageAsWallpaper>(
    () => SetImageAsWallpaperImpl(),
  );
  getIt.registerFactory<LocalDb>(
    () => FavoritesDatabaseImpl(),
  );

  getIt.registerFactory<RemoteDb>(
    () => FavoritesFirebaseDbImpl(),
  );

  getIt.registerFactory<PermissionData>(
    () => PermissionDataImpl(),
  );

  getIt.registerFactory<SearchDatabase>(
    () => SearchDatabaseImpl(),
  );

  getIt.registerFactory<ImageDatabase>(
    () => ImageDatabaseImpl(),
  );

  //App info package source
  getIt.registerFactory<PackageInfoPlus>(
    () => PackageInfoPlusImpl(),
  );

  //Hive database
  getIt.registerFactory<CustomizationPrefDatabase>(
    () => CustomizationPrefDatabaseImpl(),
  );
}
