import 'package:flutter/material.dart';
import 'package:module_3_app/Data/meal_data.dart';
import 'package:module_3_app/model/meals.dart';
import 'package:module_3_app/screens/category_meal_screen.dart';
import 'package:module_3_app/screens/home_screen.dart';
import 'package:module_3_app/screens/meal_detail_screen.dart';
import 'package:module_3_app/screens/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Select optoins map
  Map<String, bool> _filters = {
    'glutin': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  // filterred list of an afood
  List<Meal> _availableList = DUMMY_MEALS;

  // favourite list
  // ignore: prefer_final_fields
  List<Meal> _favoritedMeal = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableList = DUMMY_MEALS.where(
        (element) {
          if (_filters['glutin']! && !element.isGlutenFree) {
            return false;
          }
          if (_filters['lactose']! && !element.isLactoseFree) {
            return false;
          }
          if (_filters['vegetarian']! && !element.isVegetarian) {
            return false;
          }
          if (_filters['vegan']! && !element.isVegan) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _addFavouraite(String mealId) {
    final existingIndex =
        _favoritedMeal.indexWhere((element) => mealId == element.id);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeal.add(
          DUMMY_MEALS.firstWhere((element) => mealId == element.id),
        );
      });
    }
  }

  bool _isMealFavouraite(String id) {
    return _favoritedMeal.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Title
      title: "DeliMeal",

      theme: ThemeData(
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              titleTextStyle: const TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // Mainpage
      // routes
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) =>
            HomeScreen(favoritedMeal: _favoritedMeal),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(
              availableMeals: _availableList,
            ),
        MealDetails.routeName: (context) => MealDetails(
              addFavourite: _addFavouraite,
              isFavouraitItem: _isMealFavouraite,
            ),
        SettingScreen.routeName: (context) => SettingScreen(
              updateData: setFilters,
              glutinFree: _filters['glutin']!,
              lactose: _filters['lactose']!,
              vegen: _filters['vegetarian']!,
              vegetarian: _filters['vegan']!,
            )
      },
      // unknown route is come in account
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            favoritedMeal: _favoritedMeal,
          ),
        );
      },
    );
  }
}
