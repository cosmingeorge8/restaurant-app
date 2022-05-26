import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/presentation/pages/tables_page.dart';
import 'package:restaurantapp/presentation/providers/tables_provider.dart';

import '../providers/bottom_navigation_provider.dart';
import '../widgets/main_body.dart';
import '../widgets/search_bar.dart';
import 'bill_page.dart';
import 'orders_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            Provider.of<TableProvider>(context, listen: true)
                .currentTable
                .toString(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showSearch(
              context: context,
              delegate: MySearchDelegate(),
            ),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text('Welcome Gica!'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.table_restaurant),
              title: const Text('Tables'),
              onTap: () => showTablesScreen(),
            ),
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
            icon: Icon(Icons.shopping_cart),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Bill',
          ),
        ],
        currentIndex:
            Provider.of<BottomNavigationProvider>(context, listen: true)
                .selectedIndex,
        onTap: (value) {
          Provider.of<BottomNavigationProvider>(context, listen: false)
              .selectedIndex = value;
          setState(() {});
        },
      ),
    );
  }

  getBody() {
    switch (Provider.of<BottomNavigationProvider>(context, listen: false)
        .selectedIndex) {
      case 0:
        return const MainPageBody();
      case 1:
        return const OrdersPage();
      case 2:
        return const BillPage();
      default:
        throw Exception('Illegal state exception');
    }
  }

  showTablesScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const TablesPage(),
    ));
  }
}
