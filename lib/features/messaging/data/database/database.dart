import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:wallnex/features/messaging/data/model/message_model.dart';
import 'package:wallnex/features/messaging/data/model/serch_user_model.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';

abstract class MessagingDatabase {
  Future<SearchUserModel> searchUserInFirebase(String query);
  //Hive DB users for chat history
  Future<List<SearchUserModel>> getFromHistoryDb();
  Future<void> addToHistoryDb(SearchUser searchUser);

  Future<void> sendMessage(String receiverId, String messageText);
  Future<List<MessageModel>> getMessage(String uId, String sUid);
}

class MessagingDatabaseImpl implements MessagingDatabase {
  final _db = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<SearchUserModel> searchUserInFirebase(String query) async {
    final searchUser = await _db
        .collection('users_data')
        .where('email', isEqualTo: query)
        .get();

    return Future.value(searchUser.docs
        .map((e) => SearchUserModel.fromFireStore(e))
        .toList()
        .first);
  }

  @override
  Future<void> addToHistoryDb(SearchUser searchUser) async {
    // get the previously opened box
    final historySearch = Hive.box<SearchUser>('search_user_history');
    await historySearch.put(searchUser.uId, searchUser);
  }

  @override
  Future<List<SearchUserModel>> getFromHistoryDb() async {
    final historySearch = await Hive.openBox<SearchUser>('search_user_history');
    return Future.value(
      historySearch.values.map((e) => SearchUserModel.fromIterable(e)).toList(),
    );
  }

  @override
  Future<void> sendMessage(String receiverId, String messageText) async {
    final uId = _firebaseAuth.currentUser!.uid;
    final email = _firebaseAuth.currentUser!.email;
    final timestamp = Timestamp.now();

    MessageModel newMessage = MessageModel(
        receiverId: receiverId,
        senderId: uId,
        senderEmail: email!,
        messageText: messageText,
        timestamp: timestamp);

    final iDs = [uId, receiverId];
    iDs.sort();
    String chatRoomId = iDs.join('_');

    final docRef = _db
        .collection(uId)
        .withConverter<MessageModel>(
          fromFirestore: (snapshot, options) =>
              MessageModel.fromFireStore(snapshot, options!),
          toFirestore: (model, _) => model.toFireStore(),
        )
        .doc('chats')
        .collection(chatRoomId);

    await docRef.add(
      newMessage.toFireStore(),
    );
  }

  @override
  Future<List<MessageModel>> getMessage(String uId, String sUid) async {
    final ids = [uId, sUid];
    ids.sort();
    final chatRoomId = ids.join('_');

    final docRef = _db
        .collection(uId)
        .withConverter<MessageModel>(
          fromFirestore: (snapshot, options) =>
              MessageModel.fromFireStore(snapshot, options!),
          toFirestore: (model, _) => model.toFireStore(),
        )
        .doc(chatRoomId)
        .collection(chatRoomId)
        .orderBy('timestamp');

    final messages = await docRef.get();
    return Future.value(
      messages.docs.map((e) => MessageModel.fromFireStore(e, null)).toList(),
    );
  }
}
