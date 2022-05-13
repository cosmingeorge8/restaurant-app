import 'package:flutter/material.dart';

import '../../data/entities/product.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  ProductCard({Key? key, required this.product}) : super(key: key);

  Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            height: 130,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                  image: NetworkImage(widget.product.images[0]),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.product.name),
                Text('\$' + widget.product.price.toString()),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () => decreaseAmount(),
                        icon: const Icon(Icons.remove),
                      ),
                      Text(amount.toString()),
                      IconButton(
                        onPressed: () => increaseAmount(),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void increaseAmount() {
    amount++;
    setState(() {});
  }

  decreaseAmount() {
    if (amount == 0) {
      return;
    }
    amount--;
    setState(() {});
  }
}
