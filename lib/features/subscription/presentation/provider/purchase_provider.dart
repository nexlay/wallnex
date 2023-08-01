import 'package:flutter/cupertino.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecase/check_subscription_status.dart';
import '../../domain/usecase/fetch_products_use_case.dart';
import '../../domain/usecase/purchase_product_use_case.dart';

enum PurchaseOffer {
  free(value: 0),
  premium(value: 1);

  final int value;

  const PurchaseOffer({required this.value});
}

class PurchaseProvider extends ChangeNotifier {
  final PurchaseProduct _purchaseProduct;
  final FetchProducts _fetchProducts;
  final CheckSubscriptionStatus _checkSubscriptionStatus;

  PurchaseProvider(this._purchaseProduct, this._fetchProducts,
      this._checkSubscriptionStatus);

  bool isLoading = false;
  bool purchaseResult = false;
  Product product = Product.initialValue();
  String error = '';
  PurchaseOffer offer = PurchaseOffer.free;

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    final fetchedProducts = await _fetchProducts.call();
    fetchedProducts.fold(
      (l) => l,
      (r) {
        product = r[0];
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

  setPurchases(PurchaseOffer purchaseOffer) {
    offer = purchaseOffer;
    notifyListeners();
  }

}
