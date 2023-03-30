import 'package:flutter/material.dart';
import 'package:module_3_app/model/meals.dart';
import 'package:module_3_app/screens/categories_screen.dart';
import 'package:module_3_app/screens/favouraite_screen.dart';
import 'package:module_3_app/widget/drawer.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';
  final List<Meal> favoritedMeal;
  const HomeScreen({super.key, required this.favoritedMeal});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>>? _listPage;

  @override
  void initState() {
    _listPage = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouraiteScreen(
          favoritedMeal: widget.favoritedMeal,
        ),
        'title': 'Your Favourites',
      },
    ];
    super.initState();
  }

  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: Text(
          _listPage![_selectedValue]['title'].toString(),
        ),
      ),
      // Body part
      body: _listPage![_selectedValue]['page'] as Widget,
      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTabBar,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedValue,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.category,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(
              Icons.star,
            ),
            label: "Favourites",
          ),
        ],
      ),
      // Drawer
      drawer: const DrawerWidget(),
    );
  }

  void _selectTabBar(int index) {
    setState(() {
      _selectedValue = index;
    });
  }
}
