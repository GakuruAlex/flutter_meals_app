import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories.dart';
import 'package:flutter_meals_app/screens/meals.dart';
import 'package:flutter_meals_app/theme/theme.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = "Categories";

    Widget page = CategoriesScreen();
    if (_currentPageIndex == 1) {
      currentTitle = "My Favourites";
      page = const MealsScreen(meals: []);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
      ),
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
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
