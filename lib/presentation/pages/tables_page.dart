import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TablesPage extends StatefulWidget {
  const TablesPage({Key? key}) : super(key: key);

  @override
  State<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Tables'),
          ),
        ),
        body: const Text('Your tables will appear here... When I have time'));
  }
}
