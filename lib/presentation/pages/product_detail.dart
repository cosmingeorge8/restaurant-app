import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/presentation/providers/order_provider.dart';

import '../../data/entities/product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  var quantity = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.product.name)),
      ),
      body: Column(
        children: [
          Image.network(widget.product.images[0]),
          Text(widget.product.name),
          Text(widget.product.description),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber[600],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => decreaseQuantity(),
                    icon: const Icon(Icons.remove)),
                Text(quantity.toString()),
                IconButton(
                    onPressed: () => increaseQuantity(),
                    icon: const Icon(Icons.add)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => addToOrder(),
            child: SizedBox(
              width: size.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Add to order'),
                  const Icon(Icons.shopping_basket),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  increaseQuantity() {
    quantity++;
    setState(() {});
  }

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
      setState(() {});
    }
  }

  addToOrder() {
    if (quantity <= 0) {
      //TODO show some error
      return;
    }
    Provider.of<OrderProvider>(context, listen: false)
        .addOrderLine(widget.product, quantity);
    Navigator.pop(context);
  }
}
