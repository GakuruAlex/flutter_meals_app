import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/category_data.dart';
import 'package:flutter_meals_app/screens/categories.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';
import 'package:flutter_meals_app/screens/meals.dart';
import 'package:flutter_meals_app/theme/theme.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPageIndex = 0;
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _navigateTo(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == "filters") {
      final results = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return FilterScreen(activeFilters: _selectedFilters);
          },
        ),
      );

      //debugPrint(results.toString());
      setState(() {
        _selectedFilters = results ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = "Categories";

    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget page = CategoriesScreen(meals: availableMeals);
    if (_currentPageIndex == 1) {
      currentTitle = "My Favorites";
      page = const MealsScreen(meals: []);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
      ),
      drawer: MainDrawer(onTap: _navigateTo),

      body: page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _currentPageIndex,
        selectedItemColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
