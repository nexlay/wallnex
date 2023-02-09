import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseAuthDb {
  Stream<UserModel> get userModel;
  Future<void> updatePhotoUrl(XFile file);
}

class FirebaseAuthDbImpl implements FirebaseAuthDb {
  //An instance of FirebaseAuth
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  @override
  Stream<UserModel> get userModel =>
      _firebaseAuth.userChanges().map(_userFromFirebase);

  UserModel _userFromFirebase(User? user) {
    return UserModel.fromAuthUser(user);
  }

  @override
  Future<void> updatePhotoUrl(XFile xFile) async {
    final user = _firebaseAuth.currentUser;

    final reference = _firebaseStorage.ref().child(user!.uid).child(xFile.name);
    File file = File(xFile.path);
    final upload = await reference.putFile(file);
    final url = await upload.ref.getDownloadURL();
    await user.updatePhotoURL(url);
  }
}
