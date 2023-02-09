import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../images/data/models/wallpaper_model.dart';
import '../../../images/domain/entities/wallpaper.dart';

abstract class RemoteDb {
  //FireStore Db
  Future<void> addToFireStore(Wallpaper wallpaper);
  Future<void> deleteFromFireStore(String imageId);
  Future<List<WallpaperModel>> getFavoritesFromFireStore();
}

class FavoritesFirebaseDbImpl implements RemoteDb {
  @override
  Future<void> addToFireStore(Wallpaper wallpaper) async {
    //An instance of FirebaseAuth
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    if (user != null) {
      final docRef = db
          .collection(user.uid)
          .withConverter<WallpaperModel>(
              fromFirestore: (snapshot, options) =>
                  WallpaperModel.fromFireStore(snapshot, options!),
              toFirestore: (model, _) => model.toFireStore())
          .doc(wallpaper.id);
      await docRef.set(WallpaperModel.fromIterable(wallpaper));
    }
  }

  @override
  Future<void> deleteFromFireStore(String imageId) async {
    //An instance of FirebaseAuth
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    if (user != null) {
      await db.collection(user.uid).doc(imageId).delete();
    }
  }

  @override
  Future<List<WallpaperModel>> getFavoritesFromFireStore() async {
    //An instance of FirebaseAuth
    final user = FirebaseAuth.instance.currentUser;
    final db = FirebaseFirestore.instance;
    if (user != null) {
      final snapshot = await db.collection(user.uid).get();

      return Future.value(snapshot.docs
          .map((e) => WallpaperModel.fromQuerySnapshot(e))
          .toList());
    } else {
      return [];
    }
  }
}
