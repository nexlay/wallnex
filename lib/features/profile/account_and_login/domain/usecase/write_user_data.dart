import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';

class WriteUserDataUseCase extends UseCase<void, NoParams> {
  final UserRepo userRepo;

  WriteUserDataUseCase({required this.userRepo});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await userRepo.createUser();
  }
}
