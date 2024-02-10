import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/messaging/domain/repository/repository.dart';

class SendMessage extends UseCase<void, ParamsMultiString> {
  final MessagingRepository messagingRepository;

  SendMessage({required this.messagingRepository});

  @override
  Future<Either<Failure, void>> call(ParamsMultiString params) async {
    return await messagingRepository.sendMessage(params.params, params.params1);
  }
}
