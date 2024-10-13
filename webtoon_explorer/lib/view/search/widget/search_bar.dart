import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/filter_controller.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';

class FilterSearchBar extends StatelessWidget {
  const FilterSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FilterController>(builder: (controller) {
      return Container(
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.secondaryBackground,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.placeholderColor),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                style: AppTypography.subHeading1,
                decoration: InputDecoration(
                  hintText: 'Tower of God ..',
                  border: InputBorder.none,
                  hintStyle: AppTypography.subHeading1.copyWith(
                    color: AppColors.placeholderColor,
                  ),
                ),
                onSubmitted: (value) {
                  print("Search Bar Value: $value");
                  controller.keyword.value = value;
                  controller.isFilterOpened.value = false;
                  controller.fetchResult();
                },
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Toggling filter open/close state
                controller.isFilterOpened.value =
                    !controller.isFilterOpened.value;
              },
              icon: controller.isFilterOpened.value
                  ? const Icon(
                      Icons.filter_alt,
                      color: AppColors.primaryForeground,
                    )
                  : controller.isFilterActive.value
                      ? Stack(
                          children: [
                            const Icon(
                              Icons.filter_alt,
                              color: AppColors.primaryForeground,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Text(
                                controller.selectedFilters.value.toString(),
                                style:
                                    AppTypography.body1.copyWith(fontSize: 10),
                              ),
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.filter_alt,
                          color: AppColors.placeholderColor,
                        ),
            ),
          ],
        ),
      );
    });
  }
}
