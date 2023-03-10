import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../core/errors/failure.dart';
import '../repository/favorites_repo.dart';

class GetFavorites extends UseCase<List<Wallpaper>, NoParams> {
  final FavoritesRepo favoritesRepo;

  GetFavorites({required this.favoritesRepo});

  @override
  Future<Either<Failure, List<Wallpaper>>> call(NoParams params) async {
   return await favoritesRepo.getFavorites();
  }


}