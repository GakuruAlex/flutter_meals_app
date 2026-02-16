import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:flutter_meals_app/screens/meal_details_screen.dart';
import 'package:flutter_meals_app/widgets/meal_image.dart';
import 'package:flutter_meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void _onMealDetail(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealDetailsScreen(meal: meal);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          _onMealDetail(context, meal);
        },
        child: Stack(
          children: [
            MealImage(meal: meal),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          label: '${meal.duration} min',
                          icon: Icons.schedule,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(label: complexityText, icon: Icons.work),
                        SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                          label: affordabilityText,
                          icon: Icons.attach_money,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
