import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/get_permission_status_use_case.dart';

enum AppPermissionsStatus {
  granted,
  denied,
  permanentlyDenied,
  restricted,
  limited,
  unknown,
}

class GetPermissionNotifier extends ValueNotifier<AppPermissionsStatus> {
  final GetPermissionUseCase getPermissionUseCase;

  GetPermissionNotifier({required this.getPermissionUseCase})
      : super(AppPermissionsStatus.unknown);

  String error = '';

  Future<void> getPermissionStatus() async {
    final result = await getPermissionUseCase.call(NoParams());

    result.fold((l) => error = l.toString(), (r) => value = r);
    notifyListeners();
  }
}
