import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../../presentation/provider/get_permission_status_notifier.dart';
import '../repo/permission_repo.dart';


class GetPermissionUseCase extends UseCase<Tuple2<AppPermissions, AppPermissionsStatus>, NoParams> {
  final PermissionRepo permissionRepo;

  GetPermissionUseCase({required this.permissionRepo});

  @override
  Future<Either<Failure, Tuple2<AppPermissions, AppPermissionsStatus>>> call(NoParams params) async {
   return await permissionRepo.permissionStatus();
  }

}