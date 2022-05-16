// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:restaurantapp/data/entities/product.dart';

class OrderLine {
  final Product product;
  final int amount;

  OrderLine(
    this.product,
    this.amount,
  );

  OrderLine copyWith({
    Product? product,
    int? amount,
  }) {
    return OrderLine(
      product ?? this.product,
      amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toMap(),
      'amount': amount,
    };
  }

  factory OrderLine.fromMap(Map<String, dynamic> map) {
    return OrderLine(
      Product.fromMap(map['product'] as Map<String, dynamic>),
      map['amount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLine.fromJson(String source) =>
      OrderLine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OrderLine(product: $product, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderLine &&
        other.product == product &&
        other.amount == amount;
  }

  @override
  int get hashCode => product.hashCode ^ amount.hashCode;
}
