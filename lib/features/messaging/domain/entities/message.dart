import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String receiverId;
  final String senderId;
  final String senderEmail;
  final String messageText;
  final Timestamp timestamp;

  const Message(
      {required this.receiverId,
      required this.senderId,
      required this.senderEmail,
      required this.messageText,
      required this.timestamp});

  @override
  List<Object?> get props =>
      [receiverId, senderId, senderEmail, messageText, timestamp];
}
