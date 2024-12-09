import 'package:flutter_5iwj_2024/core/models/product.dart';

class CartLine {
  final Product product;
  final int quantity;

  CartLine({
    required this.product,
    this.quantity = 1,
  });

  factory CartLine.fromJson(Map<String, dynamic> json) {
    return CartLine(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  CartLine copyWith({
    Product? product,
    int? quantity,
  }) {
    return CartLine(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
