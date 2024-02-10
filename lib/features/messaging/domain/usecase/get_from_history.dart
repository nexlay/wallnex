import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/repository.dart';

class GetFromHistory extends UseCase<List<SearchUser>, NoParams> {
  final MessagingRepository messagingRepository;

  GetFromHistory({required this.messagingRepository});

  @override
  Future<Either<Failure, List<SearchUser>>> call(NoParams params) async {
    return await messagingRepository.getFromSearchHistory();
  }
}
