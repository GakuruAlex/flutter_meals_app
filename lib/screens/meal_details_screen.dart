import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/theme/theme.dart';
import 'package:flutter_meals_app/widgets/meal_card.dart';
import 'package:flutter_meals_app/widgets/meal_instructions.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            pinned: true,

            title: Text(meal.title, style: TextStyle(color: textIconColor)),
          ),
          SliverToBoxAdapter(
            child: MealCard(meal: meal),
          ),
          SliverToBoxAdapter(
            child: MealInstructions(
              data: meal.ingredients,
              title: "Ingredients",
            ),
          ),
          SliverToBoxAdapter(
            child: MealInstructions(
              data: meal.steps,
              title: "Steps",
            ),
          ),
        ],
      ),
    );
  }
}
