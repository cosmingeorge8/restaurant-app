import 'package:flutter/material.dart';

import '../../data/entities/order_line.dart';

class OrderLineWidget extends StatelessWidget {
  final OrderLine orderLine;
  const OrderLineWidget({
    Key? key,
    required this.orderLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      leading: Image.network(orderLine.product.images[0]),
      title: Text(orderLine.product.name),
      subtitle: Text(
          '${orderLine.amount} x \$${orderLine.product.price} = \$${orderLine.lineTotal}'),
    );
  }
}
