import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';

class Rating extends StatelessWidget {
  final String rating;
  final TextStyle style;
  const Rating({super.key, required this.rating, required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: AppColors.primaryForeground,
          size: style.fontSize! + 4,
        ),
        const SizedBox(width: 5),
        Text(rating, style: style),
      ],
    );
  }
}
