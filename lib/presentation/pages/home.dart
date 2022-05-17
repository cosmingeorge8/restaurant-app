import 'package:flutter/material.dart';
import 'package:restaurantapp/presentation/pages/tables_page.dart';

import '../widgets/app_bar.dart';
import '../widgets/main_body.dart';
import '../widgets/search_bar.dart';
import 'orders_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(widget: widget),
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MySearchDelegate()),
              icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              child: Text('Welcome Gica!'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(title: Text('Home')),
          ],
        ),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_sharp),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_restaurant_rounded),
            label: 'Tables',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) {
          _selectedIndex = value;
          setState(() {});
        },
      ),
    );
  }

  getBody() {
    switch (_selectedIndex) {
      case 0:
        return const MainPageBody();
      case 1:
        return TablesPage();
      case 2:
        return const OrdersPage();
      default:
        throw Exception('Illegal state exception');
    }
  }
}
