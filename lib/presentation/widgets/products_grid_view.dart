import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/presentation/widgets/product_card.dart';

import '../../data/entities/product.dart';

class ProdutsGridView extends StatelessWidget {
  final List<Product> products;
  const ProdutsGridView({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 10),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        });
  }
}
