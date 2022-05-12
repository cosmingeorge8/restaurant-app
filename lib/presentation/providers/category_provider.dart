import 'package:flutter/cupertino.dart';

import '../../data/entities/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categories = [
    Category('Soda', 'Cola pepsi fanta',
        'https://images.unsplash.com/photo-1622483767028-3f66f32aef97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    Category('Wine', ' Wine not?',
        'https://images.unsplash.com/photo-1535869462434-f92cc30bf40c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80'),
    Category('Beer', 'Gas you up',
        'https://images.unsplash.com/photo-1586993451228-09818021e309?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
  ];

  Future<List<Category>> getDrinksCategories() async {
    return categories;
  }

  Future<List<Category>> getFoordCategories() async {
    return categories;
  }
}
