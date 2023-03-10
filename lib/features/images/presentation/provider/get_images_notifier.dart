import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../const/const_api_url.dart';
import '../../domain/entities/wallpaper.dart';
import '../../domain/usecases/get_image_use_case.dart';
import '../../domain/usecases/get_tags_uploader_use_case.dart';

class GetImagesNotifier extends ChangeNotifier {
  final GetImageUseCase getWallpaperUseCase;
  final GetTagsAndUploaderUseCase getSingleWallpaperUseCase;

  GetImagesNotifier({
    required this.getWallpaperUseCase,
    required this.getSingleWallpaperUseCase,
  });

  bool isLoading = false;
  List<Wallpaper> imageList = [];
  Wallpaper wallpaper = Wallpaper.initialValue();

  String error = '';
  int _page = 1;
  String _url = url + page;

  int get getApiPage => _page;

  apiPagePlus() {
    _page++;
    loadImages();
    notifyListeners();
  }

  apiPageMinus() {
    if (_page > 1) {
      _page--;
      loadImages();
      notifyListeners();
    }
  }

  searchByCategories(String category) {
    _url = url + category + page;
    _page = 1;
    notifyListeners();
    loadImages();
  }

  searchByQuery(String query) {
    _url = url + query + page;
    _page = 1;
    notifyListeners();
    loadImages();
  }

  Future<void> loadImages() async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await getWallpaperUseCase(
      UrlAndPage(params1: _url, params2: _page),
    );
    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (iterable) {
        imageList = iterable.toList();
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }

  Future<void> getImageById(String id) async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the image
    final result = await getSingleWallpaperUseCase(
      ParamsString(params: id),
    );
    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (singleWallpaper) {
        wallpaper = singleWallpaper;
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }
}
