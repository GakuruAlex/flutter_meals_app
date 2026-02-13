import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/widgets/meal_card.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});
  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, int index) {
        return MealCard(meal: meals[index]);
      },
      itemCount: meals.length,
      padding: EdgeInsets.all(20),
    );

    if (meals.isEmpty) {
      content = Center(
        child: Text("No Meals yet"),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
