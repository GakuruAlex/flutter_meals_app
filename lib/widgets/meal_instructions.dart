import 'package:flutter/material.dart';
import 'package:flutter_meals_app/theme/theme.dart';

class MealInstructions extends StatelessWidget {
  const MealInstructions({super.key, required this.data, required this.title});

  final List<String> data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      shadowColor: textIconColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),

      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(color: textIconColor, fontSize: 23),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  title:  Row(
                    children: [
                      Text('${index + 1}'),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 270,
                        child: Text(
                          data[index],
                          style: TextStyle(color: textIconColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
