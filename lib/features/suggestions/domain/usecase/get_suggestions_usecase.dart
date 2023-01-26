import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../repository/suggestions_repo.dart';

class GetSuggestionsUseCase implements UseCase<Iterable<Wallpaper>, ParamsString> {
  final SuggestionsRepo suggestionsRepo;

  GetSuggestionsUseCase({required this.suggestionsRepo});

  @override
  Future<Either<Failure, Iterable<Wallpaper>>> call(ParamsString params) async {
   return await suggestionsRepo.getSuggestions(params.st);
  }

}