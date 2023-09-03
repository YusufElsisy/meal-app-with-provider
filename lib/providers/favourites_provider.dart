import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class FavouritesProvider with ChangeNotifier {
  List<Meal> favouriteMeals = [];

  void toggleFavourite(String mealId) {
    final existedIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existedIndex >= 0) {
      favouriteMeals.removeAt(existedIndex);
    } else {
      favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
    notifyListeners();
  }

  bool isFavouriteMeal(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }
}
