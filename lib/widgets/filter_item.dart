import 'package:flutter/material.dart';
import 'package:flutter_meals_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem({
    super.key,
    required this.identifier,
  });

  final Filter identifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterValue = ref.watch(filterProvider);
    final setFilter = ref.read(filterProvider.notifier);
    return SwitchListTile(
      value: filterValue[identifier]!,
      onChanged: (isSet) {
        setFilter.setFilter(identifier, isSet);
      },
      title: Text(
        identifier.name,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        "Only include ${identifier.name.toLowerCase()} meals",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      activeThumbColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
    );
  }
}
