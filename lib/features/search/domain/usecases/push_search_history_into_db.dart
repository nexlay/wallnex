import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repository/repository.dart';

class PushSearchHistoryIntoDb extends UseCase<void, String> {
  final SearchRepo searchRepo;

  PushSearchHistoryIntoDb({required this.searchRepo});

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await searchRepo.pushSearchHistory(params);
  }
}
