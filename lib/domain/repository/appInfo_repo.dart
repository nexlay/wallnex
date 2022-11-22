import 'package:dartz/dartz.dart';
import 'package:wallnex/domain/entities/app_info.dart';

import '../../core/errors/failure.dart';

abstract class AppInfoRepo {
  Future<Either<Failure, AppInfo>> getAppInfo ();
}