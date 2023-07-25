import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repo/customization_repo.dart';

class GetCrossAxisCount implements UseCase<bool, NoParams> {
  final CustomizationRepo customizationRepo;

  GetCrossAxisCount({required this.customizationRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await customizationRepo.getCrossAxisCount();
  }
}