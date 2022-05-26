// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Table {
  int tableNumber;
  Table({
    required this.tableNumber,
  });

  Table copyWith({
    int? tableNumber,
  }) {
    return Table(
      tableNumber: tableNumber ?? this.tableNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tableNumber': tableNumber,
    };
  }

  factory Table.fromMap(Map<String, dynamic> map) {
    return Table(
      tableNumber: map['tableNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Table.fromJson(String source) =>
      Table.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Table $tableNumber';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Table && other.tableNumber == tableNumber;
  }

  @override
  int get hashCode => tableNumber.hashCode;
}
