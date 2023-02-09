import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repository/favorites_repo.dart';

class AddToFireStoreUseCase extends UseCase<void, ParamsImage> {
  final FavoritesRepo favoritesRepo;

  AddToFireStoreUseCase({required this.favoritesRepo});

  @override
  Future<Either<Failure, void>> call(ParamsImage params) async {
    return await favoritesRepo.addToFireStore(params.wallpaper);
  }
}
