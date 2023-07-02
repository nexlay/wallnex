import 'package:flutter/cupertino.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecase/check_subscription_status.dart';
import '../../domain/usecase/fetch_products_use_case.dart';
import '../../domain/usecase/purchase_product_use_case.dart';

class PurchaseProvider extends ChangeNotifier {
  final PurchaseProduct _purchaseProduct;
  final FetchProducts _fetchProducts;
  final CheckSubscriptionStatus _checkSubscriptionStatus;

  PurchaseProvider(this._purchaseProduct, this._fetchProducts,
      this._checkSubscriptionStatus);

  bool isLoading = false;
  bool purchaseResult = false;
  List<Product> products = [];
  String error = '';

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    final fetchedProducts = await _fetchProducts.call();
    fetchedProducts.fold(
      (l) => l,
      (r) {
        products = r;
        isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> purchase(Product product) async {
    isLoading = true;
    notifyListeners();
    final result = await _purchaseProduct.call(product);
    result.fold((l) => l, (r) {
      purchaseResult = r.success;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> checkSubscriptionStatus() async {
    isLoading = true;
    notifyListeners();
    final result = await _checkSubscriptionStatus.call();
    result.fold(
      (l) => l,
      (r) => purchaseResult = r.success,
    );

    await fetchProducts();
    isLoading = false;
    notifyListeners();
  }
}
