import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'dart:io' as io;
import 'package:image/image.dart' as img;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class GetCroppedImageNotifier extends ChangeNotifier {
  String _filePath = '';
  double _dxOffset = 0.0;

  double get dxOffset => _dxOffset;
  set dxOffset(double dx) {
    _dxOffset = dx;
    notifyListeners();
  }

  String get filePath => _filePath;
  set path(String path) {
    _filePath = path;

    notifyListeners();
  }

  Future getFileFromCache() async {
    return await DefaultCacheManager().getSingleFile(_filePath);
  }

  Future<String> cropImage() async {
    //Get File from cache
    final file = await getFileFromCache();
    print(_filePath);
    print(_dxOffset);

    img.Image? image = img.decodeImage(io.File(file.path).readAsBytesSync());

    img.Image croppedImage = calculateCrop(image!);

    // save as new file with new resolution and path
    final resultFile = io.File('${file.dirname}/cropped-wallpaper.jpg')
      ..writeAsBytesSync(img.encodeJpg(croppedImage));
    return resultFile.path;
  }

  img.Image calculateCrop(img.Image image) {
    int x = 0;
    int y = 0;
    int deviceWidth = window.physicalSize.width.toInt();
    int imageWidth = image.width;

    double c = (imageWidth - _dxOffset) / deviceWidth;

    x = (_dxOffset * c).toInt();

    return img.copyCrop(image, x, y, image.height, image.height);
  }
}
