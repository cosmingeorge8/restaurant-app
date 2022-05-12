import 'package:flutter/material.dart';
import 'package:restaurantapp/data/entities/category.dart';

// ignore: must_be_immutable
class CategoryCard extends StatefulWidget {
  CategoryCard({Key? key, required this.category}) : super(key: key);

  Category category;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.fromBorderSide(BorderSide(
          color: Colors.black,
          width: 1,
        )),
      ),
      width: size.width / 5,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Icon(Icons.no_drinks), Text(widget.category.name)],
        ),
      ),
    );
  }
}
