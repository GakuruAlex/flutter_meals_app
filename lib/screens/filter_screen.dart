import 'package:flutter/material.dart';
import 'package:flutter_meals_app/widgets/filter_item.dart';

enum Filter { glutenFree, vegetarian, vegan, lactoseFree }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.activeFilters});
  final Map<Filter, bool> activeFilters;
  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.activeFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.activeFilters[Filter.vegan]!;
    _vegeterianFilterSet = widget.activeFilters[Filter.vegetarian]!;
  }

  void onSet(bool isSet, String identifier) {
    setState(() {
      if (identifier.toLowerCase() == 'gluten-free') {
        _glutenFreeFilterSet = isSet;
      } else if (identifier.toLowerCase() == "lactose-free") {
        _lactoseFreeFilterSet = isSet;
      } else if (identifier.toLowerCase() == "vegan") {
        _veganFilterSet = isSet;
      } else {
        _vegeterianFilterSet = isSet;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            Navigator.of(context).pop({
              Filter.vegan: _veganFilterSet,
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegeterianFilterSet,
            });
          },

          child: Column(
            children: [
              FilterItem(
                isFilterSet: _glutenFreeFilterSet,
                onFilterSet: onSet,
                identifier: "Gluten-free",
              ),

              FilterItem(
                isFilterSet: _lactoseFreeFilterSet,
                onFilterSet: onSet,
                identifier: "Lactose-free",
              ),
              FilterItem(
                isFilterSet: _veganFilterSet,
                onFilterSet: onSet,
                identifier: "Vegan",
              ),
              FilterItem(
                isFilterSet: _vegeterianFilterSet,
                onFilterSet: onSet,
                identifier: "Vegetarian",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
