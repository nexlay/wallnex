import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/purchase_result.dart';
import '../repo/purchase_repo.dart';

class CheckSubscriptionStatus {
  final PurchaseRepository repository;

  CheckSubscriptionStatus({required this.repository});

  Future<Either<Failure, PurchaseResult>> call() async {
    return await repository.checkSubscriptionStatus();
  }
}