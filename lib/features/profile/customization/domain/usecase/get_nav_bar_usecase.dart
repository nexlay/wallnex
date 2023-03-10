import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repo/customization_repo.dart';

class GetNavBarUseCase implements UseCase<bool, NoParams> {
  final CustomizationRepo customizationRepo;

  GetNavBarUseCase({required this.customizationRepo});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await customizationRepo.getCustomNavBar();
  }
}
