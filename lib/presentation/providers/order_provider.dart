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
      orderLines.add(OrderLine(product, amount));
      return true;
    }
    return false;
  }

  removeLine(OrderLine orderLine) {
    orderLines.remove(orderLine);
    notifyListeners();
  }
}
