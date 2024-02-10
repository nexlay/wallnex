import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseAuthDb {
  Stream<LocalUserModel> get userModel;
  Future<void> updatePhotoUrl();
  Future<void> deleteAllUserData();
  Future<void> createUser();
}

class FirebaseAuthDbImpl implements FirebaseAuthDb {
  //An instance of FirebaseAuth
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance;
  final _firebaseFireStore = FirebaseFirestore.instance;

  @override
  Stream<LocalUserModel> get userModel =>
      _firebaseAuth.userChanges().map<LocalUserModel>(_userFromFirebase);

  LocalUserModel _userFromFirebase(User? user) {
    return LocalUserModel.fromAuthUser(user);
  }

  @override
  Future<void> updatePhotoUrl() async {
    final user = _firebaseAuth.currentUser;
    final ImagePicker picker = ImagePicker();

    final xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
    );
    final file = File(xFile!.path);
    final reference = _firebaseStorage.ref().child(user!.uid).child(xFile.name);
    await reference.putFile(file);
    await user.updatePhotoURL(await reference.getDownloadURL());
  }

  @override
  Future<void> deleteAllUserData() async {
    final user = _firebaseAuth.currentUser;
    final snapshot = await _firebaseFireStore.collection(user!.uid).get();
    for (DocumentSnapshot doc in snapshot.docs) {
      doc.reference.delete();
    }
    await _firebaseStorage.ref().child(user.uid).delete();
    await user.delete();
  }

  @override
  Future<void> createUser() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final docRef = _firebaseFireStore
          .collection('users_data')
          .withConverter<LocalUserModel>(
            fromFirestore: (snapshot, options) =>
                LocalUserModel.fromFireStore(snapshot, options!),
            toFirestore: (model, _) => model.toFireStore(),
          )
          .doc(user.uid);
      await docRef.set(
        LocalUserModel.fromAuthUser(user),
      );
    }
  }
}
