import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../providers/filters_provider.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Meal> availableMeals =
        Provider.of<FiltersProvider>(context).availableMeals;

    final catMealsArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = catMealsArguments['categoryId'];
    String categoryTitle = catMealsArguments['categoryTitle']!;
    List<Meal> categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)), // I Added a Null Check
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
