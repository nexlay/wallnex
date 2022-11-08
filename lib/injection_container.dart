import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:wallnex/data/datasource/local_data_source.dart';
import 'package:wallnex/data/repositories/repositories_impl.dart';
import 'package:wallnex/domain/repository/wallpaper_repo.dart';
import 'package:wallnex/domain/usecases/get_wallpaper_use_case.dart';
import 'package:wallnex/domain/usecases/set_image_as_wallpaper.dart';
import 'package:wallnex/presentation/provider/get_wallpapers_notifier.dart';
import 'package:wallnex/presentation/provider/home_page_pref_notifier.dart';
import 'package:wallnex/presentation/provider/set_wallpaper_notifier.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  sl.registerFactory(
    () => GetWallpapersNotifier(
      getWallpaperUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => SetWallpaperNotifier(
      setImageAsWallpaper: sl(),
    ),
  );
  sl.registerFactory(() => Pages());

  //Domain layer
  sl.registerFactory(
    () => GetWallpaperUseCase(
      wallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => SetImageAsWallpaper(
      wallpaperRepo: sl(),
    ),
  );

  //Data layer
  sl.registerLazySingleton<WallpaperRepo>(
    () => WallpaperRepoImpl(
      localDataSource: sl(),
    ),
  );

  //Local datasource
  sl.registerFactory<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );
}
