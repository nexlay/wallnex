import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import 'package:wallnex/data/datasource/local_data_source.dart';
import 'package:wallnex/domain/repository/appInfo_repo.dart';

import '../models/app_info_model.dart';

class AppInfoRepositoriesImpl implements AppInfoRepo {
  final LocalDataSource localDataSource;

  AppInfoRepositoriesImpl({required this.localDataSource});

  @override
  Future<Either<Failure, AppInfoModel>> getAppInfo() async {
    try {
      final appInfo = await localDataSource.getAppInfoFromPackage();
      return Right(appInfo);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
