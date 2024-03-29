import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecases/get_app_info_usecase.dart';

class GetAppInfoNotifier extends ChangeNotifier {
  final GetAppInfoUseCase _getAppInfoUseCase;

  GetAppInfoNotifier(this._getAppInfoUseCase);

  String appName = '';
  String appBuild = '';
  String version = '';

  Future<void> loadAppInfo() async {
    final result = await _getAppInfoUseCase.call(NoParams());

    result.map((r) {
      appName = r.appName;
      appBuild = r.appBuild;
      version = r.appVersion;
      notifyListeners();
    });
  }

}
