import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.product.name)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.network(widget.product.images[0]),
              Text(widget.product.name),
              Text(widget.product.description),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => decreaseQuantity(),
                        icon: const Icon(Icons.remove),
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        onPressed: () => increaseQuantity(),
                        icon: const Icon(Icons.add),
                      ),
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
    if (quantity > 1) {
      quantity--;
      setState(() {});
    }
  }

  addToOrder() async {
    if (quantity <= 0) {
      return;
    }
    bool result = await Provider.of<OrderProvider>(context, listen: false)
        .addOrderLine(widget.product, quantity);
    if (result) {
      Fluttertoast.showToast(
          msg: '${widget.product.name} was added to the order');
      Navigator.pop(context);
      return;
    }
    Fluttertoast.showToast(msg: 'Product not available');
  }
}
