import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/theme/theme.dart';
import 'package:flutter_meals_app/widgets/meal_card.dart';

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
            title: Text(meal.title, style: TextStyle(color: textIconColor)),
          ),
          SliverToBoxAdapter(
            child: MealCard(meal: meal),
          ),
          SliverToBoxAdapter(
            child: Card(
              color: primaryColor,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      "Ingredients",
                      style: TextStyle(color: textIconColor, fontSize: 23),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: meal.ingredients.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          title: Text(
                            meal.ingredients[index],
                            style: TextStyle(color: textIconColor),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
