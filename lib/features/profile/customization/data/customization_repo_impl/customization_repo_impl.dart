import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import '../../domain/repo/customization_repo.dart';
import '../database/database.dart';



class CustomizationRepoImpl implements CustomizationRepo {
  final CustomizationPrefDatabase hiveDatabase;

  CustomizationRepoImpl({required this.hiveDatabase});

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

  @override
  Future<Either<Failure, bool>> getCustomNavBar() async {
    try {
      final switcher = await hiveDatabase.getNavBarStyle();
      return Right(switcher);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setCustomNavBar(currentSwitcher) async {
    try {
      final switcher = await hiveDatabase.setNavBarStyle(currentSwitcher);
      return Right(switcher);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> getCrossAxisCount() async{
    try {
      final switcher = await hiveDatabase.getCrossAxisCount();
      return Right(switcher);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setCrossAxisCount(currentSwitcher) async {
    try {
      final switcher = await hiveDatabase.setCrossAxisCount(currentSwitcher);
      return Right(switcher);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getLanguage() async {
    try {
      final language = await hiveDatabase.getLanguage();
      return Right(language);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setLanguage(String locale) async {
    try {
      final language = await hiveDatabase.setLanguage(locale);
      return Right(language);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }
}
