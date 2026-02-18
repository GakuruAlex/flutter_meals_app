import 'package:flutter/material.dart';
import 'package:flutter_meals_app/providers/filters_provider.dart';
import 'package:flutter_meals_app/widgets/filter_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
        body: Column(
          children: [
            FilterItem(
              identifier: Filter.glutenFree,
            ),

            FilterItem(
              identifier: Filter.lactoseFree,
            ),
            FilterItem(
              identifier: Filter.vegan,
            ),
            FilterItem(
              identifier: Filter.vegetarian,
            ),
          ],
        ),
      ),
    );
  }
}
