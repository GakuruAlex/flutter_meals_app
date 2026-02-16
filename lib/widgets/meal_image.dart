import 'package:flutter/material.dart';
import 'package:flutter_meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealImage extends StatelessWidget {
  const MealImage({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: MemoryImage(kTransparentImage),
      image: NetworkImage(meal.imageUrl),
      fit: BoxFit.cover,
      height: 250,
      width: double.infinity,
    );
  }
}
