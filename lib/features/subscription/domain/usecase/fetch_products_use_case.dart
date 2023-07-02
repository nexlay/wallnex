import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product.dart';
import '../repo/purchase_repo.dart';

class FetchProducts {
  final PurchaseRepository repository;

  FetchProducts({required this.repository});

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.fetchProducts();
  }
}