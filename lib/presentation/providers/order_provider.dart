import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/data/entities/product.dart';

import '../../data/entities/order_line.dart';

class OrderProvider with ChangeNotifier {
  List<OrderLine> products = [];

  Future<List<OrderLine>> getOrderLines() async {
    return products;
  }

  Future<bool> addOrderLine(Product product, int amount) async {
    if (product.available) {
      products.add(OrderLine(product, amount));
      return true;
    }
    return false;
  }
}
