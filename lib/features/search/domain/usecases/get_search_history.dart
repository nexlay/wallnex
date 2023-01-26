import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repository/repository.dart';

class GetSearchHistoryUseCase extends UseCase<List<String>, NoParams> {
  final SearchRepo searchRepo;

  GetSearchHistoryUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await searchRepo.getSearchHistory();
  }
}
