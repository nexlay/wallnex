import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final double price;
  final String currencyCode;
  final String expirationDate;
  final String shopUrl;

  const Product(
      {required this.id,
      required this.price,
      required this.currencyCode,
      required this.expirationDate,
      required this.shopUrl});

  @override
  List<Object?> get props => [
        id,
        price,
        currencyCode,
        expirationDate,
        shopUrl,
      ];

  factory Product.initialValue() => const Product(
      id: '', price: 0.0, currencyCode: '', expirationDate: '', shopUrl: '');
}
