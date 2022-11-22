import 'package:wallnex/domain/entities/app_info.dart';

class AppInfoModel extends AppInfo {
  const AppInfoModel(
      {required super.appBuild,
      required super.appName,
      required super.appVersion});
  factory AppInfoModel.infoFromPackage(Map<String, dynamic> package) {
    return AppInfoModel(
      appBuild: package['appBuild'],
      appName: package['appName'],
      appVersion: package['appVersion'],
    );
  }
}
