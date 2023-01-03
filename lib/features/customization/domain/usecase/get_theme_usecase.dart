import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repo/customization_repo.dart';

class GetThemeUseCase {
  final CustomizationRepo themeRepo;

  GetThemeUseCase({required this.themeRepo});



  Future<Either<Failure, void>> setTheme(int themeValue) async {
    return await themeRepo.setTheme(themeValue);
  }

  Future<Either<Failure, int>> getTheme() async {
    return await themeRepo.getTheme();
  }
}
