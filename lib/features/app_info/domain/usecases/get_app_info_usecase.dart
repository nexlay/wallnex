import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../entities/app_info.dart';
import '../repository/appInfo_repo.dart';


class GetAppInfoUseCase implements UseCase<AppInfo, NoParams> {
  final AppInfoRepo appInfoRepo;
  GetAppInfoUseCase({required this.appInfoRepo});

  @override
  Future<Either<Failure, AppInfo>> call(NoParams params) async {
    return await appInfoRepo.getAppInfo();
  }
}
