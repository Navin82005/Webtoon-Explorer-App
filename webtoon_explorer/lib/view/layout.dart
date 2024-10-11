import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/navigation_controller.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetX<NavigationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: controller.pages[controller.currentPage.value],
        bottomNavigationBar: CurvedNavigationBar(
          color: AppColors.secondaryBackground,
          backgroundColor: AppColors.primaryBackground,
          animationDuration: const Duration(milliseconds: 150),
          onTap: (currentIndex) => controller.currentPage.value = currentIndex,
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
                    Icons.list,
                    color: AppColors.primaryForeground,
                  )
                : const Icon(
                    Icons.list_alt_outlined,
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
