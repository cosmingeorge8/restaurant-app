import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/main_body.dart';
import '../widgets/search_bar.dart';

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
      body: const MainPageBody(),
    );
  }
}
