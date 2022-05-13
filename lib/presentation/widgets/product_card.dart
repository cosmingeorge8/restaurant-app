import 'package:flutter/material.dart';

import '../../data/entities/product.dart';
import '../pages/product_detail.dart';

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
    return Hero(
      tag: widget.product.name,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () => openProductDetail(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(widget.product.images[0]),
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.product.name,
                    ),
                    Text(
                      '\$' + widget.product.price.toString(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openProductDetail() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailPage(product: widget.product),
    ));
  }
}
