import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/get_permission_status_use_case.dart';

enum AppPermissionsStatus {
  granted,
  denied,
  permanentlyDenied,
  restricted,
  limited,
}

enum AppPermissions {
  notifications,
  storage,
}

class GetPermissionNotifier
    extends ValueNotifier<Tuple2<AppPermissions, AppPermissionsStatus>> {
  final GetPermissionUseCase getPermissionUseCase;

  GetPermissionNotifier({required this.getPermissionUseCase})
      : super(
          const Tuple2(
              AppPermissions.notifications, AppPermissionsStatus.denied),
        );

  String error = '';

  Future<void> getPermissionStatus() async {
    final result = await getPermissionUseCase.call(
      NoParams(),
    );

    result.fold((l) => error = l.toString(), (r) => value = r);
    notifyListeners();
  }
}
