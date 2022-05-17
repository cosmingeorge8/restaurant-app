import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/presentation/widgets/products_grid_view.dart';

import '../providers/product_provider.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Most popular'),
          FutureBuilder(
              future: Provider.of<ProductProvider>(context, listen: false)
                  .getFeaturedProducts(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData && snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  return ProdutsGridView(
                    products: snapshot.data,
                  );
                }
                return const Text('Something went wrong');
              }),
        ],
      ),
    );
  }
}
