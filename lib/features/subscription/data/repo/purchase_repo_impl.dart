import 'package:dartz/dartz.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/purchase_result.dart';
import '../../domain/repo/purchase_repo.dart';
import '../datasource/purchase_datasource.dart';
import '../models/product_models.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  final PurchaseDataSource purchaseDataSource;

  PurchaseRepositoryImpl({required this.purchaseDataSource});

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      final productsList = await purchaseDataSource.fetchProducts();
      return Right(productsList);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, PurchaseResult>> purchaseProduct(
      Product product) async {
    try {
      final result = await purchaseDataSource.purchaseProduct(product);
      return Right(result);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, PurchaseResult>> checkSubscriptionStatus() async {
    try {
      final result = await purchaseDataSource.checkSubscriptionsStatus();
      return Right(result);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }
}
