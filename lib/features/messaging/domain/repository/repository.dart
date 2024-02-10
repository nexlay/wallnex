import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/messaging/domain/entities/message.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';


abstract class MessagingRepository {
  Future<Either<Failure, SearchUser>> searchUserInFirebase(String query);

  Future<Either<Failure, void>> setToHistory (SearchUser searchUser);
  Future<Either<Failure, List<SearchUser>>> getFromSearchHistory ();

  Future<Either<Failure, void>> sendMessage(String receiverId, String message);
  Future<Either<Failure, List<Message>>> getMessages (String uId, String sUid);
}
