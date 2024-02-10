import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallnex/features/messaging/domain/entities/message.dart';

class MessageModel extends Message {
  const MessageModel(
      {required super.receiverId,
      required super.senderId,
      required super.senderEmail,
      required super.messageText,
      required super.timestamp});

  factory MessageModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return MessageModel(
      receiverId: data?['receiverId'],
      senderId: data?['senderId'],
      senderEmail: data?['senderEmail'],
      messageText: data?['messageText'],
      timestamp: data?['timestamp'],
    );
  }


  Map<String, dynamic> toFireStore() {
    return {
      'receiverId': receiverId,
      'senderId': senderId,
      'senderEmail': senderEmail,
      'messageText': messageText,
      'timestamp': timestamp,
    };
  }
}
