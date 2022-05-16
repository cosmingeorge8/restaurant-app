import 'package:flutter/cupertino.dart';

class TablesPage extends StatefulWidget {
  TablesPage({Key? key}) : super(key: key);

  @override
  State<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('Your tables will appear here... When I have time')),
    );
  }
}
