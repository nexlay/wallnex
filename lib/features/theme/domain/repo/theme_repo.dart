import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';


abstract class ThemeRepo {

  Future<Either<Failure, void>> setTheme(int themeValue);
  Future<Either<Failure, int>> getTheme();
}
