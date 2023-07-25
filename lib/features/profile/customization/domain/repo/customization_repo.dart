import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';



abstract class CustomizationRepo {
  ///Theme
  Future<Either<Failure, void>> setTheme(int themeValue);
  Future<Either<Failure, int>> getTheme();

  ///Custom NavBar
  Future<Either<Failure, void>> setCustomNavBar (currentSwitcher);
  Future<Either<Failure, bool>> getCustomNavBar ();

  ///Custom crossAxisCount on HomePage
  Future<Either<Failure, void>> setCrossAxisCount (currentSwitcher);
  Future<Either<Failure, bool>> getCrossAxisCount ();

}
