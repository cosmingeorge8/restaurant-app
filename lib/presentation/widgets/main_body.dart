import 'package:flutter/material.dart';
import 'package:restaurantapp/presentation/widgets/popular_products.dart';

import 'drinks_categories.dart';
import 'food_categories.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          DrinksCategories(screenHeight: screenHeight),
          FoodCategories(screenHeight: screenHeight),
          PopularProducts(screenHeight: screenHeight),
        ],
      ),
    );
  }
}
