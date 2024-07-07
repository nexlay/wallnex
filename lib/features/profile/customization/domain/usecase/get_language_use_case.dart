import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/customization_repo.dart';

class GetLanguageUseCase extends UseCase<String, NoParams> {
  final CustomizationRepo customizationRepo;

  GetLanguageUseCase({required this.customizationRepo});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await customizationRepo.getLanguage();
  }
}