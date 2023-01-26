import 'package:equatable/equatable.dart';

class AppInfo extends Equatable {
  final String appName;
  final String appVersion;
  final String appBuild;

  const AppInfo(
      {required this.appBuild,
      required this.appName,
      required this.appVersion});

  @override
  List<Object?> get props => [appName, appBuild, appVersion];
}
