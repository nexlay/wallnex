import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/repository.dart';

class SetToHistory extends UseCase<void , ParamsSearchUser> {
  final MessagingRepository messagingRepository;

  SetToHistory({required this.messagingRepository});

  @override
  Future<Either<Failure, void>> call(ParamsSearchUser params) async {
  return await messagingRepository.setToHistory(params.params);
  }


}