import 'package:flutter/cupertino.dart';

import '../../data/entities/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> products = [
    Product(
      name: 'Cola',
      description: 'Mare bautur',
      price: 5,
      available: true,
      images: [
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
      ],
    ),
    Product(
      name: 'Cola',
      description: 'Mare bautur',
      price: 5,
      available: true,
      images: [
        'https://static01.nyt.com/images/2021/02/14/dining/carbonara-horizontal/carbonara-horizontal-articleLarge-v2.jpg'
      ],
    ),
    Product(
      name: 'Cola',
      description: 'Mare bautur',
      price: 5,
      available: true,
      images: [
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
      ],
    ),
    Product(
      name: 'Cola',
      description: 'Mare bautur',
      price: 5,
      available: true,
      images: [
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
      ],
    ),
  ];

  Future<List<Product>> getFeaturedProducts() async {
    return products;
  }
}
