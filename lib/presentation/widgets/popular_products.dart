import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/presentation/widgets/product_card.dart';

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
                  return GridView.builder(
                      padding: const EdgeInsets.only(bottom: 10),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        return ProductCard(product: snapshot.data[index]);
                      });
                }
                return const Text('Something went wrong');
              }),
        ],
      ),
    );
  }
}
