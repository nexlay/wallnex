import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repo/customization_repo.dart';

class SetCrossAxisCount implements UseCase<void, ParamsBool> {
  final CustomizationRepo customizationRepo;

  SetCrossAxisCount({required this.customizationRepo});

  @override
  Future<Either<Failure, void>> call(ParamsBool params) async {
    return await customizationRepo.setCrossAxisCount(params.params);
  }
}