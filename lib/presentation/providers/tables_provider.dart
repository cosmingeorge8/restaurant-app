import 'package:flutter/cupertino.dart';
import 'package:restaurantapp/data/entities/table.dart' as t;

class TableProvider with ChangeNotifier {
  t.Table? currentTable;

  List<t.Table> tables = [
    t.Table(tableNumber: 1),
    t.Table(tableNumber: 2),
  ];

  Future<List<t.Table>> getTables() async {
    return tables;
  }

  void setCurrentTable(t.Table table) {
    currentTable = table;
    notifyListeners();
  }

  String getCurrentTable() {
    return currentTable != null
        ? currentTable!.toString()
        : 'No table selected';
  }
}
