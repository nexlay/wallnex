import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/messaging/domain/repository/repository.dart';

import '../entities/search_user.dart';

class SearchUserInFirebase extends UseCase<SearchUser, ParamsString> {
  final MessagingRepository messagingRepository;

  SearchUserInFirebase({required this.messagingRepository});

  @override
  Future<Either<Failure, SearchUser>> call(ParamsString params) async {
    return await messagingRepository.searchUserInFirebase(params.params);
  }
}
