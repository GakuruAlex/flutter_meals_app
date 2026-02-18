import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/providers/favorites_provider.dart';
import 'package:flutter_meals_app/theme/theme.dart';
import 'package:flutter_meals_app/widgets/meal_card.dart';
import 'package:flutter_meals_app/widgets/meal_instructions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMealAFavorite = ref.watch(favoriteMealsProvider).contains(meal);
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  final toggleFavorite = ref
                      .read(favoriteMealsProvider.notifier)
                      .onFavoriteMealToggle(meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        toggleFavorite
                            ? "${meal.title} added to favorites!"
                            : "${meal.title} removed from favorites ",

                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainer,
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.star,
                  color: isMealAFavorite ? accentColor : textIconColor,
                ),
              ),
            ],

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
