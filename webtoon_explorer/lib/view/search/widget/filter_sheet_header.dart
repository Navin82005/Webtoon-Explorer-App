import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/filter_controller.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/widget/secondary_button.dart';

class FilterSheetHeader extends StatelessWidget {
  const FilterSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Filter and Sort", style: AppTypography.heading1),
        SecondaryButton(
          onTap: Get.find<FilterController>().clearFilters,
          disableBorder: true,
          child: Text(
            "Clear",
            style: AppTypography.subHeading1.copyWith(
              color: AppColors.placeholderColor,
            ),
          ),
        ),
      ],
    );
  }
}
