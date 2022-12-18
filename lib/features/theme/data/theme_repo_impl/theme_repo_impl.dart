import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import 'package:wallnex/features/theme/data/database/theme_pref_database.dart';
import 'package:wallnex/features/theme/domain/repo/theme_repo.dart';

class ThemeRepoImpl implements ThemeRepo {
  final ThemePrefDatabase hiveDatabase;

  ThemeRepoImpl({required this.hiveDatabase});

  @override
  Future<Either<Failure, int>> getTheme() async {
    try {
      final theme = await hiveDatabase.getTheme();
      return Right(theme);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setTheme(int themeValue) async {
    try {
      final theme = await hiveDatabase.setTheme(themeValue);
      return Right(theme);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

}
