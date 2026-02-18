import 'package:flutter_meals_app/models/meal.dart';
import 'package:riverpod/legacy.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool onFavoriteMealToggle(Meal meal) {
    bool isFavorite = state.contains(meal);

    if (isFavorite) {
      state = state.where((currentMeal) => currentMeal.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
      return FavoriteMealsNotifier();
    });
