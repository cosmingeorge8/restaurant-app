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
      name: 'Carbonara',
      description: 'Mare bautur',
      price: 5,
      available: true,
      images: [
        'https://static01.nyt.com/images/2021/02/14/dining/carbonara-horizontal/carbonara-horizontal-articleLarge-v2.jpg'
      ],
    ),
    Product(
      name: 'Beer',
      description:
          'Beer is one of the oldest and most widely consumed alcoholic drinks in the world, and the third most popular drink overall after water and tea.',
      price: 5,
      available: true,
      images: [
        'https://hips.hearstapps.com/del.h-cdn.co/assets/cm/15/11/3200x1600/54f65d39ab05d_-_183341797.jpg?resize=980:*'
      ],
    ),
    Product(
      name: 'Fanta',
      description: 'Mare bautur',
      price: 5,
      available: true,
      images: [
        'https://l28.nl/media/cache/webp/77/Fanta_Orange_smal_blik_24x330_ml.436x436.webp'
      ],
    ),
  ];

  Future<List<Product>> getFeaturedProducts() async {
    return products;
  }
}
