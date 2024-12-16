import 'package:flutter/material.dart';
import 'package:multi_telas/data/dummy_data.dart';
import 'package:multi_telas/models/meal.dart';
import 'package:multi_telas/models/setting.dart';
import 'package:multi_telas/screens/category_screen.dart';
import 'package:multi_telas/screens/categorys_meals_screen.dart';
import 'package:multi_telas/screens/meal_detail_screen.dart';
import 'package:multi_telas/screens/settings_screen.dart';
import 'package:multi_telas/screens/tabs_screen.dart';
import 'package:multi_telas/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _avalibleMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _avalibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
        primaryColor: Colors.pink,
        splashColor: Colors.yellow,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 6, 89, 231),
        ),
        fontFamily: 'Raleway',
        canvasColor: Colors.pink,
        textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
            )),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategorysMealsScreen(_avalibleMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals),
      },
      //CRIAR UM ROTA DE ERROR
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            return const CategoryScreen();
          },
        );
      },
    );
  }
}
