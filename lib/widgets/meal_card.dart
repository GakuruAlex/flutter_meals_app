import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/theme/theme.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          spacing: 8,
          children: [
            Text(
              meal.title,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            Image.network(
              meal.imageUrl,
              errorBuilder: (context, error, stackTrace) => Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.error,
                      color: accentColor,
                    ),
                    Expanded(
                      child: Text(
                        error.toString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Row()),
          ],
        ),
      ),
    );
  }
}
