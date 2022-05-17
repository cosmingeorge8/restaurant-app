import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/data/entities/order_line.dart';
import 'package:restaurantapp/presentation/providers/order_provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
        future:
            Provider.of<OrderProvider>(context, listen: true).getOrderLines(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData && snapshot.hasError) {
              return const Text('Something went wrong');
            }
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) =>
                              deleteItem(context, snapshot.data[index]),
                          label: 'Delete',
                          backgroundColor: Colors.red,
                        )
                      ],
                    ),
                    child: OrderLineWidget(orderLine: snapshot.data[index]),
                  );
                });
          }
          return const Text('Something went wrong');
        });
  }

  deleteItem(BuildContext context, OrderLine orderLine) async {
    await Provider.of<OrderProvider>(context, listen: false)
        .removeLine(orderLine);
  }
}

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
