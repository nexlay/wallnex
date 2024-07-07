import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/customization_repo.dart';

class SetLanguageUseCase extends UseCase<void, ParamsString> {
  final CustomizationRepo customizationRepo;

  SetLanguageUseCase({required this.customizationRepo});

  @override
  Future<Either<Failure, void>> call(ParamsString params) async {
    return await customizationRepo.setLanguage(params.params);
  }
}