import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:wallnex/data/datasource/sqlite_database.dart';
import 'package:wallnex/data/datasource/local_data_source.dart';
import 'package:wallnex/data/repositories/favorite_repo_impl.dart';
import 'package:wallnex/data/repositories/repositories_app_info_impl.dart';
import 'package:wallnex/data/repositories/repositories_impl.dart';
import 'package:wallnex/domain/repository/appInfo_repo.dart';
import 'package:wallnex/domain/repository/wallpaper_repo.dart';
import 'package:wallnex/domain/usecases/get_app_info_usecase.dart';
import 'package:wallnex/domain/usecases/get_favorite_wallpapers_use_case.dart';
import 'package:wallnex/domain/usecases/get_wallpaper_use_case.dart';
import 'package:wallnex/domain/usecases/set_image_as_wallpaper.dart';
import 'package:wallnex/presentation/provider/get_app_info_notifier.dart';
import 'package:wallnex/presentation/provider/get_favorites_wallpapers_notifier.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_from_api_notifier.dart';
import 'package:wallnex/presentation/provider/get_home_page_notifier.dart';

import 'domain/repository/favorite_wallpaper_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  sl.registerFactory(
    () => GetWallpapersNotifier(
      getWallpaperUseCase: sl(),
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

  sl.registerFactory(() => Pages());

  //Domain layer
  sl.registerFactory(
    () => GetWallpaperUseCase(
      wallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(() => GetAppInfoUseCase(appInfoRepo: sl()));
  sl.registerFactory(
    () => SetImageAsWallpaper(
      wallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetFavoriteWallpapers(
      favoriteWallpaperRepo: sl(),
    ),
  );

  //Data layer
  sl.registerLazySingleton<WallpaperRepo>(
    () => WallpaperRepoImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<AppInfoRepo>(
    () => AppInfoRepositoriesImpl(
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<FavoriteWallpaperRepo>(
    () => FavoriteRepoImpl(
      database: sl(),
    ),
  );

  //Local datasource
  sl.registerFactory<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  //Database
  sl.registerFactory<LocalDatabase>(() => LocalDatabaseImpl());
}
