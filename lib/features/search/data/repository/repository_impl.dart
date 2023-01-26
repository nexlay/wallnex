import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import 'package:wallnex/features/search/data/database/database.dart';
import 'package:wallnex/features/search/domain/repository/repository.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchDatabase searchDatabase;

  SearchRepoImpl({required this.searchDatabase});

  @override
  Future<Either<Failure, void>> pushSearchHistory(String query) async {
    try {
      final search = await searchDatabase.pushSearchHistory(query);
      return Right(search);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getSearchHistory() async {
    try {
      final search = await searchDatabase.getSearchHistory();
      return Right(search);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
