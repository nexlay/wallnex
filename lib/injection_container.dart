import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wallnex/features/app_info/data/datasource/package_info.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/domain/usecases/get_favorite_wallpapers_use_case.dart';
import 'package:wallnex/features/images/domain/usecases/get_suggestions_usecase.dart';
import 'package:wallnex/features/images/domain/usecases/get_tags_uploader_use_case.dart';
import 'package:wallnex/features/images/domain/usecases/set_image_as_wallpaper_use_case.dart';

import 'package:wallnex/presentation/provider/get_app_info_notifier.dart';
import 'package:wallnex/presentation/provider/get_cropped_image_notifier.dart';
import 'package:wallnex/presentation/provider/get_customizartion_notifier.dart';
import 'package:wallnex/presentation/provider/get_favorites_images_notifier.dart';
import 'package:wallnex/presentation/provider/get_suggestions_notifier.dart';
import 'package:wallnex/presentation/provider/get_theme_notifier.dart';
import 'package:wallnex/presentation/provider/get_images_notifier.dart';
import 'package:wallnex/presentation/provider/get_default_home_page_notifier.dart';
import 'package:wallnex/presentation/provider/set_image_as_wallpaper_notifier.dart';
import 'features/app_info/data/repositories/repositories_app_info_impl.dart';
import 'features/app_info/domain/repository/appInfo_repo.dart';
import 'features/app_info/domain/usecases/get_app_info_usecase.dart';
import 'features/customization/data/database/customization_pref_database.dart';
import 'features/customization/data/theme_repo_impl/customization_repo_impl.dart';
import 'features/customization/domain/repo/customization_repo.dart';
import 'features/customization/domain/usecase/get_nav_bar_usecase.dart';
import 'features/customization/domain/usecase/get_theme_usecase.dart';
import 'features/images/data/datasource/api_service.dart';
import 'features/images/data/repositories/repositories_impl.dart';
import 'features/images/domain/repository/wallpaper_repo.dart';
import 'features/images/domain/usecases/get_wallpaper_use_case.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(WallpaperAdapter());
  //Init hive NoSQL database
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('customization');
  await Hive.openBox<Wallpaper>('favorites');

  sl.registerFactory(
    () => GetCroppedImageNotifier(),
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
    () => GetWallpaperUseCase(
      wallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetTagsAndUploaderUseCase(
      wallpaperRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => GetFavoriteWallpapersUseCase(
      favoriteWallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetSuggestionsUseCase(
      wallpaperRepo: sl(),
    ),
  );
  sl.registerFactory(
    () => GetAppInfoUseCase(
      appInfoRepo: sl(),
    ),
  );

  sl.registerFactory(
    () => GetThemeUseCase(themeRepo: sl()),
  );

  sl.registerFactory(
    () => GetNavBarUseCase(customizationRepo: sl()),
  );

  sl.registerFactory(
    () => SetImageAsWallpaperUseCase(
      wallpaperRepo: sl(),
    ),
  );

  //Data layer
  sl.registerLazySingleton<WallpaperRepo>(
    () => WallpaperRepoImpl(
      wallhavenApi: sl(),
    ),
  );

  sl.registerLazySingleton<AppInfoRepo>(
    () => AppInfoRepositoriesImpl(
      packageInfoPlus: sl(),
    ),
  );

  sl.registerLazySingleton<CustomizationRepo>(
    () => CustomizationRepoImpl(hiveDatabase: sl()),
  );

  sl.registerFactory<ApiDataSource>(
    () => ApiDataSourceImpl(),
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
