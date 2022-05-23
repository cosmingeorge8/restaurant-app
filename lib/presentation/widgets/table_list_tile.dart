import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/data/entities/table.dart' as t;
import 'package:restaurantapp/presentation/providers/tables_provider.dart';

class TableListTile extends StatelessWidget {
  final t.Table table;
  const TableListTile({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(table.tableNumber.toString()),
      title: Text('Table number ${table.tableNumber}'),
      onTap: () async => setTable(context),
    );
  }

  setTable(BuildContext context) async {
    Provider.of<TableProvider>(context, listen: false).currentTable = table;
    Navigator.of(context).pop();
  }
}
