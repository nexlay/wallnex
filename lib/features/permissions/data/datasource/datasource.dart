import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:permission_handler/permission_handler.dart';
import '../../presentation/provider/get_permission_status_notifier.dart';
import 'dart:io';

abstract class PermissionData {
  Future<Tuple2<AppPermissions, AppPermissionsStatus>>
      storagePermissionStatus();
}

class PermissionDataImpl implements PermissionData {
  @override
  Future<Tuple2<AppPermissions, AppPermissionsStatus>>
      storagePermissionStatus() async {
    //Get current device SDK
   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    //In app permission status
    AppPermissionsStatus appPermissionStatus = AppPermissionsStatus.denied;
    //In app permission kind
    AppPermissions appPermissions = AppPermissions.notifications;
    //Permission kind from permission_handler
    Permission permission = Permission.notification;

   if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 30) {
        permission = Permission.notification;
      } else {
        permission = Permission.storage;
        appPermissions = AppPermissions.storage;
      }
    }

    PermissionStatus status = await permission.status;

    if (status == PermissionStatus.denied) {
      status = await permission.request();
    } else if (status == PermissionStatus.permanentlyDenied) {
      status = await permission.request();
    }

    const map = {
      PermissionStatus.granted: AppPermissionsStatus.granted,
      PermissionStatus.denied: AppPermissionsStatus.denied,
      PermissionStatus.permanentlyDenied:
          AppPermissionsStatus.permanentlyDenied,
    };

    appPermissionStatus = map[status] ?? appPermissionStatus;

    return Future(() => Tuple2(appPermissions, appPermissionStatus));
  }
}
