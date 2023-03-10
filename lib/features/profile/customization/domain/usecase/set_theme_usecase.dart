import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/customization_repo.dart';

class SetThemeUseCase extends UseCase<void, ParamsWithInt> {
  final CustomizationRepo themeRepo;

  SetThemeUseCase({required this.themeRepo});

  @override
  Future<Either<Failure, void>> call(ParamsWithInt params) async {
    return await themeRepo.setTheme(params.params);
  }
}
