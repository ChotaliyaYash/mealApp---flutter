import 'package:flutter/material.dart';
import 'package:module_3_app/model/category.dart';
import 'package:module_3_app/model/meals.dart';
import 'package:module_3_app/widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static String routeName = 'category-meal';
  final List<Meal> availableMeals;
  const CategoryMealScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  Category? categoryData;
  List<Meal>? categoryMeal;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    // Route data
    categoryData = ModalRoute.of(context)!.settings.arguments as Category;
    // Meals where the category is matched
    categoryMeal = widget.availableMeals.where(
      (element) {
        return element.categories.contains(categoryData!.id);
      },
    ).toList();
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryData!.title),
      ),
      body: categoryMeal!.isEmpty
          ? Center(
              child: Text(
                "No Item in this",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemCount: categoryMeal!.length,
              itemBuilder: (context, index) {
                return MealItem(
                  mealData: categoryMeal![index],
                );
              },
            ),
    );
  }

  void removeItem(String mealId) {
    if (_loadedInitData) {
      setState(
        () {
          categoryMeal!.removeWhere((element) => element.id == mealId);
        },
      );
    }
  }
}
