import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';

class SearchUserModel extends SearchUser {
  const SearchUserModel(
      {required super.uId,
      required super.email,
      required super.name,
      required super.photoUrl,
      required super.isAnonymous});

  factory SearchUserModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return SearchUserModel(
      email: data?['email'],
      name: data?['name'],
      uId: data?['uId'],
      photoUrl: data?['photoUrl'],
      isAnonymous: data?['isAnonymous'] ?? false,
    );
  }
  factory SearchUserModel.fromIterable(SearchUser searchUser) {
    return SearchUserModel(
      uId: searchUser.uId,
      email: searchUser.email,
      name: searchUser.name,
      photoUrl: searchUser.photoUrl,
      isAnonymous: searchUser.isAnonymous,
    );
  }
}
