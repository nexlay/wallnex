import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';


abstract class CustomizationRepo {
  ///Theme
  Future<Either<Failure, void>> setTheme(int themeValue);
  Future<Either<Failure, int>> getTheme();

  ///Custom NavBar
  Future<Either<Failure, void>> setCustomNavBar (currentSwitcher);
  Future<Either<Failure, bool>> getCustomNavBar ();

}
