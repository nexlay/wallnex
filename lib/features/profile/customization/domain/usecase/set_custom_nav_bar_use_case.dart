import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repo/customization_repo.dart';


class SetNavBarUseCase implements UseCase<void, ParamsBool> {
  final CustomizationRepo customizationRepo;

  SetNavBarUseCase({required this.customizationRepo});

  @override
  Future<Either<Failure, void>> call(ParamsBool params) async {
    return await customizationRepo.setCustomNavBar(params.params);
  }
}
