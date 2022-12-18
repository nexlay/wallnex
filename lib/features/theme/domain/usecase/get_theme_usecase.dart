import 'package:dartz/dartz.dart';
import 'package:wallnex/features/theme/domain/repo/theme_repo.dart';
import '../../../../core/errors/failure.dart';

class GetThemeUseCase {
  final ThemeRepo themeRepo;

  GetThemeUseCase({required this.themeRepo});



  Future<Either<Failure, void>> setTheme(int themeValue) async {
    return await themeRepo.setTheme(themeValue);
  }

  Future<Either<Failure, int>> getTheme() async {
    return await themeRepo.getTheme();
  }
}
