import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../repo/customization_repo.dart';


class GetNavBarUseCase implements UseCase<void, ParamsFour> {
  final CustomizationRepo customizationRepo;

  GetNavBarUseCase({required this.customizationRepo});

  @override
  Future<Either<Failure, void>> call(ParamsFour params) async {
    return await customizationRepo.setCustomNavBar(params.params);
  }

  Future<Either<Failure, bool>> get() async {
    return await customizationRepo.getCustomNavBar();
  }
}
