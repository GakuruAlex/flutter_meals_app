import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Text(
      meal.title,
      style:
          Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );
  }
}
