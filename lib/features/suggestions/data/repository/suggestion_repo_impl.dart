import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/suggestions/data/data/suggestions_data.dart';
import 'package:wallnex/features/suggestions/domain/repository/suggestions_repo.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../images/data/models/wallpaper_model.dart';

class SuggestionsRepoImpl implements SuggestionsRepo{
  final SuggestionsData suggestionsData;

  SuggestionsRepoImpl({required this.suggestionsData});
  @override
  Future<Either<Failure, Iterable<WallpaperModel>>> getSuggestions(
      String id) async {
    try {
      final result = await suggestionsData.getSuggestions(id);
      return Right(result);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

}