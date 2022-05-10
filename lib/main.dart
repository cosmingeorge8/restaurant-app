import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
        title: AppBarTitle(widget: widget),
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MySearchDelegate()),
              icon: const Icon(Icons.search)),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Welcome Gica!'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          const ListTile(title: Text('Home')),
        ],
      )),
      body: Column(
        children: [],
      ),
    );
  }
}

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

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.title));
  }
}

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
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Hungry?  Get some food'));
  }
}
