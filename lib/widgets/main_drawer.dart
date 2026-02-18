import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onTap});
  final void Function(String identifier) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 230,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withAlpha(175),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 32,
                  color: Theme.of(context).colorScheme.primaryFixed,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () => {onTap("meals")},
            leading: Icon(
              Icons.restaurant,
              size: 32,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 22,
              ),
            ),
          ),

          ListTile(
            onTap: () => {onTap("filters")},
            leading: Icon(
              Icons.filter_alt_outlined,
              size: 32,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
