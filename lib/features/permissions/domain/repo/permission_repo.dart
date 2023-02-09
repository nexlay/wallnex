import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../presentation/provider/get_permission_status_notifier.dart';


abstract class PermissionRepo {
  Future<Either<Failure, AppPermissionsStatus>> permissionStatus ();
}