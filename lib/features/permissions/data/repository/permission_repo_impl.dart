import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/repo/permission_repo.dart';
import '../../presentation/provider/get_permission_status_notifier.dart';
import '../datasource/datasource.dart';

class PermissionRepoImpl implements PermissionRepo {
  final PermissionData permissionData;
  PermissionRepoImpl({required this.permissionData});
  @override
  Future<Either<Failure,Tuple2<AppPermissions, AppPermissionsStatus>>> permissionStatus() async {
    try {
      final status = await permissionData.storagePermissionStatus();
      return Right(status);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }
}
