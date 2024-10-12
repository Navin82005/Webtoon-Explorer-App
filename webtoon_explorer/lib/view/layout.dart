import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:webtoon_explorer/controller/favorite_controller.dart';
import 'package:webtoon_explorer/controller/navigation_controller.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/view/onboarding/onboarding.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var navigationController = Get.put(NavigationController());
  final tmp = Get.put(FavoriteController());

  @override
  void initState() {
    super.initState();
    checkFirstTime();
  }

  checkFirstTime() async {
    var pref = await SharedPreferences.getInstance();
    if (pref.getBool("isFirstTime") == null) {
      Get.off(() => const Onboarding());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<NavigationController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(toolbarHeight: 5, backgroundColor: Colors.transparent),
        backgroundColor: AppColors.primaryBackground,
        body: controller.pages[controller.currentPage.value],
        bottomNavigationBar: CurvedNavigationBar(
          color: AppColors.secondaryBackground,
          backgroundColor: AppColors.primaryBackground,
          animationDuration: const Duration(milliseconds: 150),
          onTap: (currentIndex) => controller.currentPage.value = currentIndex,
          index: controller.currentPage.value,
          items: [
            controller.currentPage.value == 0
                ? const Icon(
                    Icons.home,
                    color: AppColors.primaryForeground,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: AppColors.secondaryForeground,
                  ),
            controller.currentPage.value == 1
                ? const Icon(
                    Icons.search,
                    color: AppColors.primaryForeground,
                  )
                : const Icon(
                    Icons.search,
                    color: AppColors.secondaryForeground,
                  ),
            controller.currentPage.value == 2
                ? const Icon(
                    Icons.favorite,
                    color: AppColors.primaryForeground,
                  )
                : const Icon(
                    Icons.favorite_border,
                    color: AppColors.secondaryForeground,
                  ),
            controller.currentPage.value == 3
                ? const Icon(
                    Icons.person,
                    color: AppColors.primaryForeground,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: AppColors.secondaryForeground,
                  ),
          ],
        ),
      );
    });
  }
}
