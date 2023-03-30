import 'package:flutter/material.dart';
import 'package:module_3_app/widget/drawer.dart';

class SettingScreen extends StatefulWidget {
  // route name
  static String routeName = '/setting';
  // filter upfdate function
  final Function updateData;
  final bool glutinFree;
  final bool vegetarian;
  final bool vegen;
  final bool lactose;

  const SettingScreen({
    super.key,
    required this.updateData,
    required this.glutinFree,
    required this.vegetarian,
    required this.vegen,
    required this.lactose,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool? _glutenFree;
  bool? _vegiterian;
  bool? _vigan;
  bool? _loctoseFree;

  @override
  void initState() {
    _glutenFree = widget.glutinFree;
    _vegiterian = widget.vegetarian;
    _vigan = widget.vegen;
    _loctoseFree = widget.lactose;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Settings"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'glutin': _glutenFree!,
                'vegetarian': _vegiterian!,
                'lactose': _loctoseFree!,
                'vegan': _vigan!,
              };
              widget.updateData(selectedFilter);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          // Button
          Expanded(
              child: ListView(
            children: <Widget>[
              // gluten free switch
              _buildSwitchListTile(
                _glutenFree!,
                "Gluten-Free",
                "Only include gluten-free meals.",
                (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),

              // gluten free switch
              _buildSwitchListTile(
                _vegiterian!,
                "Vegetarian",
                "Only include vegetarian meals.",
                (value) {
                  setState(() {
                    _vegiterian = value;
                  });
                },
              ),

              // gluten free switch
              _buildSwitchListTile(
                _vigan!,
                "Vegan",
                "Only include vegan meals.",
                (value) {
                  setState(() {
                    _vigan = value;
                  });
                },
              ),

              // gluten free switch
              _buildSwitchListTile(
                _loctoseFree!,
                "Lactose-Free",
                "Only include lactose-free meals.",
                (value) {
                  setState(() {
                    _loctoseFree = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: const DrawerWidget(),
    );
  }

  SwitchListTile _buildSwitchListTile(
    bool changeValue,
    String title,
    String subTitle,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: changeValue,
      onChanged: (value) => updateValue(value),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
