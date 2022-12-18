import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/app_info.dart';


abstract class AppInfoRepo {
  Future<Either<Failure, AppInfo>> getAppInfo ();
}