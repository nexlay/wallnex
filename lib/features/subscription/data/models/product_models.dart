import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/models/offerings_wrapper.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.price,
    required super.currencyCode,
    required super.expirationDate,
    required super.shopUrl,
  });

  factory ProductModel.fromJson(
      Offerings? offerings, CustomerInfo? customerInfo) {
    return ProductModel(
      id: offerings?.current?.monthly?.storeProduct.identifier ?? '',
      price: offerings?.current?.monthly?.storeProduct.price ?? 0.0,
      currencyCode:
          offerings?.current?.monthly?.storeProduct.currencyCode ?? '',
      expirationDate: customerInfo?.latestExpirationDate ?? '',
      shopUrl: customerInfo?.managementURL ?? '',
    );
  }
}
