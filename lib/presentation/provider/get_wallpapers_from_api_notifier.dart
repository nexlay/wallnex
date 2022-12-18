import 'package:flutter/cupertino.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../features/images/domain/entities/wallpaper.dart';
import '../../features/images/domain/usecases/get_tags_uploader_use_case.dart';
import '../../features/images/domain/usecases/get_wallpaper_use_case.dart';

class GetWallpapersNotifier extends ChangeNotifier {
  final GetWallpaperUseCase getWallpaperUseCase;
  final GetTagsAndUploaderUseCase getSingleWallpaperUseCase;
  GetWallpapersNotifier({
    required this.getWallpaperUseCase,
    required this.getSingleWallpaperUseCase,
  });

  bool isLoading = false;
  List<Wallpaper> imageList = [];
  Wallpaper wallpaperWithTags = const Wallpaper(
    path: '',
    id: '',
    category: '',
    size: 0,
    views: 0,
    resolution: '',
    colors: [],
    shortUrl: '',
    fileType: '',
    name: '',
    uploaderName: '',
    thumbsLarge: '',
  );
  String error = '';

  String _url = apiUrl;
  int _page = 1;

  int get getApiPage => _page;

  apiPagePlus() {
    _page++;
    loadAllWallpapers();
    notifyListeners();
  }

  apiPageMinus() {
    if (_page > 1) {
      _page--;
      loadAllWallpapers();
      notifyListeners();
    }
  }

  categoriesUrl(String url) {
    _url = url;
    loadAllWallpapers();
    notifyListeners();
  }

  Future<void> loadAllWallpapers() async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await getWallpaperUseCase(
      ParamsTwo(params: _url, param: _page),
    );
    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (list) {
        imageList = list;
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }

  Future<void> getTagsAndUploader(String id) async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await getSingleWallpaperUseCase(
      ParamsThree(params: id),
    );
    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (singleWallpaper) {
        wallpaperWithTags = singleWallpaper;
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }
}
