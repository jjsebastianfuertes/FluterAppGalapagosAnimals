import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/island_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      children: ISLAND_CATEGORIES
          .map(
            (categoryData) => CategoryItem(
                categoryData.id, categoryData.title, categoryData.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // width of the grid
          childAspectRatio: 3 / 2, //aspect boxes height related to width
          crossAxisSpacing: 7, //space between boxes x axis
          mainAxisSpacing: 7), //space between boxes y axis
    );
  }
}
