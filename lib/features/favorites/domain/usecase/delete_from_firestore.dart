import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/favorites_repo.dart';


class DeleteFromFireStoreUseCase extends UseCase<void, ParamsString>{
  final FavoritesRepo favoritesRepo;

  DeleteFromFireStoreUseCase({required this.favoritesRepo});


  @override
  Future<Either<Failure, void>> call(ParamsString params) async {
   return await favoritesRepo.deleteFromFireStore(params.st);
  }

}