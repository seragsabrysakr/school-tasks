import 'package:flutter/material.dart';
import 'package:schooltasks/constants/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.arrow_drop_down_circle,
          color: maincolor,
        ),
        Text('Categoryitem')
      ],
    );
  }
}
