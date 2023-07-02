import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product.dart';
import '../entities/purchase_result.dart';

abstract class PurchaseRepository {
  Future<Either<Failure,List<Product>>> fetchProducts();
  Future<Either<Failure, PurchaseResult>> purchaseProduct(Product product);
  Future<Either<Failure, PurchaseResult>> checkSubscriptionStatus();
}