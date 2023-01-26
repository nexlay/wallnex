import 'package:package_info_plus/package_info_plus.dart';
import '../models/app_info_model.dart';

abstract class PackageInfoPlus {
  Future<AppInfoModel> getAppInfoFromPackage();
}

class PackageInfoPlusImpl extends PackageInfoPlus {
  @override
    Future<AppInfoModel> getAppInfoFromPackage() async {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String appName = packageInfo.appName;
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      return Future(
            () => AppInfoModel(
            appBuild: buildNumber, appName: appName, appVersion: version),
      );
    }
  }

