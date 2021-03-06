import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/presentation/pages/home.dart';
import 'package:restaurantapp/presentation/providers/bottom_navigation_provider.dart';
import 'package:restaurantapp/presentation/providers/category_provider.dart';
import 'package:restaurantapp/presentation/providers/order_provider.dart';
import 'package:restaurantapp/presentation/providers/product_provider.dart';
import 'package:restaurantapp/presentation/providers/tables_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => CategoryProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => OrderProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => TableProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => BottomNavigationProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Dishes'),
    );
  }
}
