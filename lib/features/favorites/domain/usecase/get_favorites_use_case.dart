import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/favorites/domain/repository/favorites_repo.dart';
import '../../../images/domain/entities/wallpaper.dart';

class GetFavoritesUseCase extends UseCase<List<Wallpaper>, NoParams>{
  final FavoritesRepo favoritesRepo;

  GetFavoritesUseCase({required this.favoritesRepo});

  @override
  Future<Either<Failure, List<Wallpaper>>> call(NoParams params) async {
    return await favoritesRepo.getFavorites();
  }


}
