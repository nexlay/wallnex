import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../../features/app_info/domain/usecases/get_app_info_usecase.dart';

class GetAppInfoNotifier extends ChangeNotifier {
  final GetAppInfoUseCase getAppInfoUseCase;

  GetAppInfoNotifier({required this.getAppInfoUseCase});

  String appName = '';
  String appBuild = '';
  String version = '';

  Future<void> loadAppInfo() async {
    final result = await getAppInfoUseCase.call(NoParams());

    result.map((r) {
      appName = r.appName;
      appBuild = r.appBuild;
      version = r.appVersion;
      notifyListeners();
    });
  }

  @override
  notifyListeners();
}
