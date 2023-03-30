import 'package:flutter/material.dart';
import 'package:module_3_app/Data/category_data.dart';
import 'package:module_3_app/widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map(
        (categoryData) {
          return CategoryItem(categoryData: categoryData);
        },
      ).toList(),
    );
  }
}
