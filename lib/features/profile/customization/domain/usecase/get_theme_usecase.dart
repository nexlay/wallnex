import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../../core/errors/failure.dart';
import '../repo/customization_repo.dart';

class GetThemeUseCase extends UseCase<int, NoParams> {
  final CustomizationRepo themeRepo;

  GetThemeUseCase({required this.themeRepo});

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await themeRepo.getTheme();
  }
}
