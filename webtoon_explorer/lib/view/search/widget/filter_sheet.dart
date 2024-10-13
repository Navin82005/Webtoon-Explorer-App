import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/controller/filter_controller.dart';
import 'package:webtoon_explorer/view/search/widget/filter_sheet_header.dart';
import 'package:webtoon_explorer/view/search/widget/select_genre.dart';
import 'package:webtoon_explorer/view/search/widget/select_rating.dart';
import 'package:webtoon_explorer/view/search/widget/select_status.dart';
import 'package:webtoon_explorer/view/widget/primary_button.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 24),
          const FilterSheetHeader(),
          const SizedBox(height: 12),
          const SelectGenre(),
          const SizedBox(height: 12),
          const SelectStatus(),
          const SizedBox(height: 12),
          const SelectRating(),
          const SizedBox(height: 24),
          PrimaryButton(
            onTap: () {
              var filterController = Get.find<FilterController>();
              filterController.setFilter();
              filterController.fetchResult();
              filterController.isFilterOpened.value = false;
            },
            text: "Save",
          )
        ],
      ),
    );
  }
}
