import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/messaging/domain/entities/message.dart';
import 'package:wallnex/features/messaging/domain/repository/repository.dart';

class GetMessage extends UseCase<List<Message>, ParamsMultiString> {
  final MessagingRepository messagingRepository;

  GetMessage({required this.messagingRepository});

  @override
  Future<Either<Failure, List<Message>>> call(ParamsMultiString params) async {
    return await messagingRepository.getMessages(params.params, params.params1);
  }
}
