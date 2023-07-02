import 'package:equatable/equatable.dart';

class PurchaseResult extends Equatable{
  final bool success;


  const PurchaseResult({required this.success,});
  @override
  List<Object?> get props => [
    success,

  ];
}