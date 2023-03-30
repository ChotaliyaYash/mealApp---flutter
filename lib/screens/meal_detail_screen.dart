// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:module_3_app/model/meals.dart';

class MealDetails extends StatelessWidget {
  static String routeName = '/meal-detail';
  final Function addFavourite;
  final Function isFavouraitItem;
  const MealDetails({
    super.key,
    required this.addFavourite,
    required this.isFavouraitItem,
  });

  @override
  Widget build(BuildContext context) {
    Meal mealData = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                mealData.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // ingreadents
            buildSectionTitle(
              context,
              "Ingredients",
            ),
            // ingreadents length
            buildContainerListView(
              child: ListView.builder(
                itemCount: mealData.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(mealData.ingredients[index]),
                    ),
                  );
                },
              ),
            ),

            // Steps
            buildSectionTitle(context, "Steps"),
            // Steps Details
            buildContainerListView(
              child: ListView.builder(
                itemCount: mealData.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          child: Text("# ${index + 1}"),
                        ),
                        title: Text(mealData.steps[index]),
                      ),
                      // Divider
                      const Divider()
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFavourite(mealData.id);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: isFavouraitItem(mealData.id)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }

// Contaienr of list view

  Container buildContainerListView({
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: 350,
      child: child,
    );
  }

// Section title
  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
