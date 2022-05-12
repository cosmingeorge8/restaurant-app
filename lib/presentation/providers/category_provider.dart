import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

import '../../data/entities/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categories = [
    Category('Soda', 'Cola pepsi fanta'),
    Category('Wine', ' Wine not?'),
    Category('Beer', 'Gas you up')
  ];

  Future<List<Category>> getDrinksCategories() async {
    return categories;
  }
}
