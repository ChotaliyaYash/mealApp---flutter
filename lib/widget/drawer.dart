import 'package:flutter/material.dart';
import 'package:module_3_app/screens/home_screen.dart';
import 'package:module_3_app/screens/setting_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // Heading
          Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 20,
          ),
          // options
          settingOption(
            "Meals",
            Icons.restaurant,
            () {
              onTapHandler(
                context,
                HomeScreen.routeName,
              );
            },
          ),
          settingOption(
            "Settings",
            Icons.settings,
            () {
              onTapHandler(
                context,
                SettingScreen.routeName,
              );
            },
          ),
        ],
      ),
    );
  }

  void onTapHandler(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  Widget settingOption(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
