import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../repository/suggestions_repo.dart';

class GetSuggestionsByColorUseCase
    implements UseCase<Iterable<Wallpaper>, ParamsMultiString> {
  final SuggestionsRepo suggestionsRepo;

  GetSuggestionsByColorUseCase({required this.suggestionsRepo});

  @override
  Future<Either<Failure, Iterable<Wallpaper>>> call(
      ParamsMultiString params) async {
    return await suggestionsRepo.getSuggestionsByColor(
        params.params, params.params1);
  }
}
