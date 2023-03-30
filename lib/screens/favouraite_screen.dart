import 'package:flutter/material.dart';
import 'package:module_3_app/model/meals.dart';
import 'package:module_3_app/widget/meal_item.dart';

class FavouraiteScreen extends StatelessWidget {
  final List<Meal> favoritedMeal;
  const FavouraiteScreen({super.key, required this.favoritedMeal});

  @override
  Widget build(BuildContext context) {
    return favoritedMeal.isEmpty
        ? Center(
            child: Text(
              "You have no favouraits yet, start adding some!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        : ListView.builder(
            itemCount: favoritedMeal.length,
            itemBuilder: (context, index) {
              return MealItem(
                mealData: favoritedMeal[index],
              );
            },
          );
  }
}
