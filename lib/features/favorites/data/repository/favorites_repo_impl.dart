import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/favorites/domain/repository/favorites_repo.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../images/data/models/wallpaper_model.dart';
import '../data/local_database.dart';
import '../data/remote_database.dart';
import '../data/sync.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final LocalDb localDb;
  final RemoteDb remoteDb;
  final SyncDatabases syncDatabases;

  FavoritesRepoImpl({
    required this.localDb,
    required this.remoteDb,
    required this.syncDatabases,
  });
  @override
  Future<Either<Failure, void>> addToFavorite(Wallpaper wallpaper) async {
    try {
      final favorite = await localDb.addToFavorite(wallpaper);
      return Right(favorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromFavorite(String id) async {
    try {
      final deleteFavorite = await localDb.deleteFromFavorite(id);
      return Right(deleteFavorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkFavorite(String id) async {
    try {
      final isFavorite = await localDb.checkFavorites(id);
      return Right(isFavorite);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addToFireStore(Wallpaper wallpaper) async {
    try {
      return Right(await remoteDb.addToFireStore(wallpaper));
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromFireStore(String imageId) async {
    try {
      return Right(await remoteDb.deleteFromFireStore(imageId));
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> getFavorites() async {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        final remote = await remoteDb.getFavoritesFromFireStore();
        final local = await localDb.getFavorites();

        if (local.length > remote.length) {
          await syncDatabases.sync();
        }
        return Right(remote);
      } on LocalExceptions {
        return Left(
          LocalFailure(),
        );
      }
    } else {
      try {
        final local = await localDb.getFavorites();
        return Right(local);
      } on LocalExceptions {
        return Left(
          LocalFailure(),
        );
      }
    }
  }
}
