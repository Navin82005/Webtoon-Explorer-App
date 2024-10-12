import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/layout.dart';
import 'package:webtoon_explorer/view/widget/primary_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/toon_gala.png"),
            const SizedBox(height: 12),
            Text(
              "Welcome to Toon Gala",
              style: AppTypography.heading1.copyWith(
                color: AppColors.primaryForeground,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Explore a massive library of amazing cartoons across multiple genres, tailored just for you!",
              textAlign: TextAlign.center,
              style: AppTypography.heading2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32),
        child: PrimaryButton(
          onTap: () async {
            var pref = await SharedPreferences.getInstance();
            pref.setBool("isFirstTime", false);
            Get.off(() => const Layout());
          },
          text: "Let's Get Started!",
        ),
      ),
    );
  }
}
