import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';

import '../../domain/repository/appInfo_repo.dart';
import '../datasource/package_info.dart';
import '../models/app_info_model.dart';

class AppInfoRepositoriesImpl implements AppInfoRepo {
  final PackageInfoPlus packageInfoPlus;

  AppInfoRepositoriesImpl({required this.packageInfoPlus});

  @override
  Future<Either<Failure, AppInfoModel>> getAppInfo() async {
    try {
      final appInfo = await packageInfoPlus.getAppInfoFromPackage();
      return Right(appInfo);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
