import 'package:flutter/cupertino.dart';

import '../../main.dart';

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
