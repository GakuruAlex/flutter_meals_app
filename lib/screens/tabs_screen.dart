import 'package:flutter/material.dart';
import 'package:flutter_meals_app/providers/favorites_provider.dart';
import 'package:flutter_meals_app/providers/filters_provider.dart';
import 'package:flutter_meals_app/screens/categories.dart';
import 'package:flutter_meals_app/screens/filter_screen.dart';
import 'package:flutter_meals_app/screens/meals.dart';
import 'package:flutter_meals_app/theme/theme.dart';
import 'package:flutter_meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currentPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _navigateTo(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == "filters") {
      Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return FilterScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle = "Categories";
    final availableMeals = ref.watch(filteredMeals);
    Widget page = CategoriesScreen(meals: availableMeals);
    if (_currentPageIndex == 1) {
      final myFavoriteMeals = ref.watch(favoriteMealsProvider);
      currentTitle = "My Favorites";
      page = MealsScreen(meals: myFavoriteMeals);
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
