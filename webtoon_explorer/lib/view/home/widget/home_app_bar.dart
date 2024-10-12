import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/core/meta/app_data.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppData.AppName,
            style: AppTypography.heading1.copyWith(
              fontSize: 24,
              color: AppColors.primaryForeground,
            ),
          ),
          const Icon(Icons.search, color: AppColors.primaryForeground),
        ],
      ),
    );
  }
}
