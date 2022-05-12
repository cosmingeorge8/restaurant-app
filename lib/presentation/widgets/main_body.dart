import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category_provider.dart';
import 'category_card.dart';

class MainPageBody extends StatelessWidget {
  const MainPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const Text("Drinks"),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FutureBuilder(
              future: Provider.of<CategoryProvider>(context, listen: false)
                  .getDrinksCategories(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (!snapshot.hasData && snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  return SizedBox(
                    height: screenHeight / 8,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(category: snapshot.data[index]);
                        }),
                  );
                }
                return const Text('Something went wrong');
              }),
        ),
      ],
    );
  }
}
