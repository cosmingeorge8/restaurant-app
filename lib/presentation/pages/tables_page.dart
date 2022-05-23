import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantapp/presentation/providers/tables_provider.dart';

import '../widgets/table_list_tile.dart';

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
        body: FutureBuilder(
            future:
                Provider.of<TableProvider>(context, listen: true).getTables(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (!snapshot.hasData && snapshot.hasError) {
                  return const Center(
                    child: Text('No data'),
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return TableListTile(
                        table: snapshot.data[index],
                      );
                    });
              }
              return const Text('Something went wrong');
            }));
  }
}
