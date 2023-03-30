import 'package:flutter/material.dart';
import 'package:module_3_app/model/category.dart';
import 'package:module_3_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category categoryData;
  const CategoryItem({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categoryData.color.withOpacity(0.7),
              categoryData.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          categoryData.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

// Push to category screen
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealScreen.routeName,
      arguments: categoryData,
    );
  }
}
