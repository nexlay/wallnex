import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import '../../presentation/provider/get_permission_status_notifier.dart';

abstract class PermissionData {
  Future<AppPermissionsStatus> storagePermissionStatus();
}

class PermissionDataImpl implements PermissionData {
  @override
  Future<AppPermissionsStatus>
      storagePermissionStatus() async {
    PermissionStatus status;
    AppPermissionsStatus appPermissionStatus = AppPermissionsStatus.unknown;

    if (Platform.isAndroid) {
      status = await Permission.storage.request();
    } else {
      //For IOS
      status = await Permission.photos.request();
    }

    switch (status) {
      case PermissionStatus.granted:
        appPermissionStatus = AppPermissionsStatus.granted;
        break;
      case PermissionStatus.denied:
        appPermissionStatus = AppPermissionsStatus.denied;
        break;
      case PermissionStatus.permanentlyDenied:
        appPermissionStatus = AppPermissionsStatus.permanentlyDenied;
        break;
      case PermissionStatus.restricted:
        appPermissionStatus = AppPermissionsStatus.restricted;
        break;
      case PermissionStatus.limited:
        appPermissionStatus = AppPermissionsStatus.limited;
        break;
      default:
        appPermissionStatus = AppPermissionsStatus.unknown;
    }

    return appPermissionStatus;
  }


}
