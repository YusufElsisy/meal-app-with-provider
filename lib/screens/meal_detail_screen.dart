import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';
import '../providers/favourites_provider.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  const MealDetailScreen({super.key});

  Widget buildSectionTitle(BuildContext context, titleText) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 5),
      child: Text(titleText, style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget buildContainer(Widget containerChild) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        height: 160,
        width: 320,
        child: containerChild);
  }

  @override
  Widget build(BuildContext context) {
    Function toggleFavourite =
        Provider.of<FavouritesProvider>(context).toggleFavourite;
    Function isFavouriteMeal =
        Provider.of<FavouritesProvider>(context).isFavouriteMeal;

    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Colors.orangeAccent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index],
                            style: Theme.of(context).textTheme.titleSmall),
                      ));
                },
                itemCount: selectedMeal.ingredients.length)),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                            leading:
                                CircleAvatar(child: Text('# ${index + 1}')),
                            title: Text(selectedMeal.steps[index],
                                style: Theme.of(context).textTheme.titleSmall)),
                        const Divider()
                      ],
                    ),
                itemCount: selectedMeal.steps.length))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => toggleFavourite(mealId),
          child:
              Icon(isFavouriteMeal(mealId) ? Icons.star : Icons.star_border)),
    );
  }
}
