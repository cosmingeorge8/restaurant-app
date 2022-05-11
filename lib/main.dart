import 'package:flutter/material.dart';
import 'package:restaurantapp/presentation/widgets/app_bar.dart';
import 'package:restaurantapp/presentation/widgets/bottom_navigation.dart';
import 'package:restaurantapp/presentation/widgets/search_bar.dart';

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
        children: const [
          DrawerHeader(
            child: Text('Welcome Gica!'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(title: Text('Home')),
        ],
      )),
    );
  }
}
