import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/data/entities/product.dart';
import 'package:restaurantapp/presentation/providers/order_provider.dart';
import 'package:restaurantapp/presentation/providers/product_provider.dart';
import 'package:restaurantapp/presentation/widgets/products_grid_view.dart';

import '../pages/product_detail.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ProdutsGridView(products: getProducts(context));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> products = getProducts(context);
    return ListView.builder(
      itemBuilder: (context, index) => SearchSuggestion(
        product: products[index],
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
    );
  }

  List<Product> getProducts(BuildContext context) {
    var lowerQuery = query.toLowerCase();
    List<Product> products =
        Provider.of<ProductProvider>(context, listen: false)
            .products
            .where((element) =>
                element.name.toLowerCase().startsWith(lowerQuery) ||
                element.name.toLowerCase().endsWith(lowerQuery) ||
                element.description.toLowerCase().startsWith(lowerQuery) ||
                element.description.toLowerCase().endsWith(lowerQuery))
            .toList();
    return products;
  }
}

class SearchSuggestion extends StatefulWidget {
  final Product product;

  const SearchSuggestion({Key? key, required this.product}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchSuggestionState();
}

class _SearchSuggestionState extends State<SearchSuggestion> {
  var quantity = 0;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => openProductDetail(context),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        leading: Image.network(widget.product.images[0]),
        title: Text(widget.product.name),
        subtitle: quantity == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.product.description),
                  IconButton(
                    onPressed: () => increaseQuantity(),
                    icon: const Icon(Icons.add),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.product.description),
                  IconButton(
                    onPressed: decreaseQuantity,
                    icon: const Icon(Icons.remove),
                  ),
                  Text(quantity.toString()),
                  IconButton(
                    onPressed: increaseQuantity,
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: addToOrder,
                    icon: const Icon(Icons.add_shopping_cart),
                  )
                ],
              ));
  }

  void openProductDetail(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailPage(product: widget.product),
    ));
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

  void addToOrder() async {
    bool result = await Provider.of<OrderProvider>(context, listen: false)
        .addOrderLine(widget.product, quantity);
    if (result) {
      Fluttertoast.showToast(
          msg: '${widget.product.name} was added to the order');
      quantity = 0;
      setState(() {});
    }
  }
}
