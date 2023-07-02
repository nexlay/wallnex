import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product.dart';
import '../entities/purchase_result.dart';
import '../repo/purchase_repo.dart';

class PurchaseProduct {
  final PurchaseRepository repository;

  PurchaseProduct({required this.repository});

  Future<Either<Failure,PurchaseResult>> call(Product product) async {
    return await repository.purchaseProduct(product);
  }
}