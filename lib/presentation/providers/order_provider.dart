import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/data/entities/product.dart';

import '../../data/entities/order_line.dart';

class OrderProvider with ChangeNotifier {
  List<OrderLine> orderLines = [];

  Future<List<OrderLine>> getOrderLines() async {
    return orderLines;
  }

  Future<bool> addOrderLine(Product product, int amount) async {
    if (product.available) {
      var result = alreadyExists(product);
      result.fold(
        (orderLine) => increaseQuantity(orderLine, amount),
        (r) => orderLines.add(
          OrderLine(product, amount),
        ),
      );
      return true;
    }
    return false;
  }

  removeLine(OrderLine orderLine) {
    orderLines.remove(orderLine);
    notifyListeners();
  }

  Either<OrderLine, bool> alreadyExists(Product product) {
    for (var orderLine in orderLines) {
      if (orderLine.product == product) {
        return Left(orderLine);
      }
    }
    return const Right(false);
  }

  void increaseQuantity(OrderLine orderLine, int amount) {
    orderLine.amount += amount;
  }

  double getLinesTotal() {
    double totalAmt = 0;
    for (var orderLine in orderLines) {
      totalAmt += orderLine.lineTotal;
    }
    return totalAmt;
  }

  submitOrder() {}
}
