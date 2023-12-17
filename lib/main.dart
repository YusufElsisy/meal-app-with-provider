import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/filters_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'providers/favourites_provider.dart';
import 'providers/filters_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FiltersProvider()),
        ChangeNotifierProvider(create: (_) => FavouritesProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData().copyWith(
          primaryColor: Colors.pink,
          focusColor: Colors.amber,
          scaffoldBackgroundColor: const Color.fromRGBO(255, 254, 229, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.pink,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(fontSize: 24, color: Colors.white),
          ),
          //fontFamily: 'Raleway',
          drawerTheme: const DrawerThemeData(
              backgroundColor: Color.fromRGBO(255, 254, 229, 1)),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodySmall:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                titleMedium: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold),
              )),

      /*ThemeData(
          ),*/
      routes: {
        '/': (_) => const TabsScreen(),
        CategoryMealsScreen.routeName: (_) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => const MealDetailScreen(),
        FiltersScreen.routeName: (_) => const FiltersScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      },
    );
  }
}
