import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/controller/filter_controller.dart';
import 'package:webtoon_explorer/controller/genre_filter_controller.dart';
import 'package:webtoon_explorer/controller/rating_filter_controller.dart';
import 'package:webtoon_explorer/controller/status_filter_controller.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/home/widget/view_card.dart';
import 'package:webtoon_explorer/view/search/widget/filter_sheet.dart';
import 'package:webtoon_explorer/view/search/widget/search_bar.dart';
import 'package:webtoon_explorer/view/widget/loader_widget.dart';
import 'package:webtoon_explorer/view/widget/primary_button.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late FilterController filterController;
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  initializeData() {
    filterController = Get.put(FilterController());
    Get.put(GenreFilterController()).fetchAvailableGenres();
    Get.put(StatusFilterController()).fetchAvailableStatus();
    Get.put(RatingFilterController()).fetchAvailableStatus();
  }

  @override
  void dispose() {
    super.dispose();
    filterController.clearFilters();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.primaryBackground,
        body: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterSearchBar(),
              const SizedBox(height: 24),
              GetX<FilterController>(
                builder: (controller) {
                  print(controller.allActiveFilters);
                  if (controller.allActiveFilters.isNotEmpty) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.allActiveFilters.length,
                        itemBuilder: (context, index) => PrimaryButton(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            controller.allActiveFilters[index].capitalize!,
                            style: AppTypography.body1,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              GetX<FilterController>(
                builder: (controller) {
                  if (controller.isLoading.value) {
                    return const LoaderWidget();
                  }

                  if (controller.isFilterOpened.value) {
                    return const FilterSheet();
                  }

                  if (controller.result.isNotEmpty) {
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                        ),
                        shrinkWrap: true,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: controller.result.length,
                        itemBuilder: (context, index) => ViewCard(
                          mangaData: controller.result[index],
                          genre: controller.result[index].genre[0],
                          enableOverlay: true,
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            color: AppColors.primaryForeground,
                            size: Get.width / 4,
                          ),
                          Text(
                            "Search Manhwa",
                            style: AppTypography.heading1.copyWith(
                              color: AppColors.primaryForeground,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
