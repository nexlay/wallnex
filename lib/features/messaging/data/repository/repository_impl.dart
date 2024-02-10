import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/messaging/data/database/database.dart';
import 'package:wallnex/features/messaging/data/model/message_model.dart';
import 'package:wallnex/features/messaging/data/model/serch_user_model.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';
import 'package:wallnex/features/messaging/domain/repository/repository.dart';
import '../../../../core/exceptions/exceptions.dart';

class MessagingRepoImpl implements MessagingRepository {
  final MessagingDatabase messagingDatabase;

  MessagingRepoImpl({required this.messagingDatabase});

  @override
  Future<Either<Failure, SearchUserModel>> searchUserInFirebase(
      String query) async {
    try {
      final searchResult = await messagingDatabase.searchUserInFirebase(query);
      return Right(searchResult);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<SearchUser>>> getFromSearchHistory() async {
    try {
      final searchHistory = await messagingDatabase.getFromHistoryDb();
      return Right(searchHistory);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setToHistory(SearchUser searchUser) async {
    try {
      final searchHistory = await messagingDatabase.addToHistoryDb(searchUser);
      return Right(searchHistory);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(String receiverId, String message) async {
    try {
      final sendMessage = await messagingDatabase.sendMessage(receiverId, message);
      return Right(sendMessage);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<MessageModel>>> getMessages(String uId, String sUid) async {
    try {
      final getMessages = await messagingDatabase.getMessage(uId, sUid);
      return Right(getMessages);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }
}
