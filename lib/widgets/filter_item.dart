import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.isFilterSet,
    required this.onFilterSet,
    required this.identifier,
  });

  final bool isFilterSet;
  final String identifier;
  final Function(bool isSet, String identifier) onFilterSet;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: isFilterSet,
      onChanged: (isSet) {
        onFilterSet(isSet, identifier);
      },
      title: Text(
        identifier,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        "Only include ${identifier.toLowerCase()} meals",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
    );
  }
}
