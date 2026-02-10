import 'package:flutter/material.dart';
import 'package:flutter_meals_app/theme/theme.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = accentColor,
  });
  final String id;
  final String title;
  final Color color;
}
