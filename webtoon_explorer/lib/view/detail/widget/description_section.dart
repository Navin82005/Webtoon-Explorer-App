import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/core/conf/app_typography.dart';

class DescriptionSection extends StatelessWidget {
  final List<String> descriptions;
  const DescriptionSection({super.key, required this.descriptions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Story", style: AppTypography.heading1),
        const SizedBox(height: 8),
        ...descriptions.map(
          (description) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              description.capitalizeFirst!,
              style: AppTypography.body1,
            ),
          ),
        ),
      ],
    );
  }
}
