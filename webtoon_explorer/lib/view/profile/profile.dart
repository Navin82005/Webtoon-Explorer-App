import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Center(
        child: Text("Profile of User", style: AppTypography.heading1),
      ),
    );
  }
}
