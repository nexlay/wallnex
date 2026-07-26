import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:wallnex/core/config/env/env.dart';
import '../../domain/entities/product.dart';
import '../models/product_models.dart';
import '../models/purchase_result_model.dart';

abstract class PurchaseDataSource {
  Future<List<ProductModel>> fetchProducts();
  Future<PurchaseResultModel> purchaseProduct(Product product);
  Future<PurchaseResultModel> checkSubscriptionsStatus();
}

class PurchaseDataSourceImpl implements PurchaseDataSource {
  @override
  Future<List<ProductModel>> fetchProducts() async {
    final customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo.activeSubscriptions.isNotEmpty &&
        customerInfo.entitlements.all[Env.entitlementsId]!.isActive) {
      return Future.value(customerInfo.activeSubscriptions
          .map(
            (e) => ProductModel.fromJson(null, customerInfo),
          )
          .toList());
    } else {
      final offerings = await Purchases.getOfferings();
      return Future.value(
        offerings.all.values
            .map(
              (e) => ProductModel.fromJson(offerings, null),
            )
            .toList(),
      );
    }
  }

  @override
  Future<PurchaseResultModel> purchaseProduct(Product product) async {
    try {
      // 1. Zapisujemy wynik zakupu do zmiennej purchaseResult
      final purchaseResult = await Purchases.purchaseProduct(product.id);

      // 2. Odwołujemy się najpierw do customerInfo, a dopiero potem sprawdzamy entitlements
      if (purchaseResult
          .customerInfo.entitlements.all[Env.entitlementsId]!.isActive) {
        return const PurchaseResultModel(success: true);
      } else {
        return const PurchaseResultModel(success: false);
      }
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        return const PurchaseResultModel(success: false);
      }
      return const PurchaseResultModel(success: false);
    }
  }

  @override
  Future<PurchaseResultModel> checkSubscriptionsStatus() async {
    final customerInfo = await Purchases.getCustomerInfo();
    if (customerInfo.activeSubscriptions.isNotEmpty &&
        customerInfo.entitlements.all[Env.entitlementsId]!.isActive) {
      return const PurchaseResultModel(success: true);
    } else {
      return const PurchaseResultModel(success: false);
    }
  }
}
