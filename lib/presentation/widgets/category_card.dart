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
      width: size.width / 5,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  widget.category.imgPath,
                  width: 100,
                  height: size.height / 10,
                )),
            Text(widget.category.name)
          ],
        ),
      ),
    );
  }
}
