import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/categories.dart';
import 'package:flutter_meals_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: themeData,
      home: const CategoriesScreen(),
    );
  }
}
