import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu_sharp), label: 'Menu'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Account'),
    ]);
  }
}
