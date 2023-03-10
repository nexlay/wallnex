import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';

class GetUserUseCase {
  final UserRepo userRepo;

  GetUserUseCase({required this.userRepo});

  Stream<LocalUser> get user {
    return userRepo.user;
  }
}
