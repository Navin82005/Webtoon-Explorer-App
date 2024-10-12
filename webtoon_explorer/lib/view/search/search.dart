import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: Text("Search Page", style: AppTypography.heading1),
      ),
    );
  }
}
