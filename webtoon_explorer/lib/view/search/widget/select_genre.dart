import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/genre_filter_controller.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/widget/primary_container.dart';
import 'package:webtoon_explorer/view/widget/secondary_container.dart';

class SelectGenre extends StatelessWidget {
  const SelectGenre({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Genres", style: AppTypography.heading2),
        const SizedBox(height: 8),
        GetX<GenreFilterController>(builder: (controller) {
          return Wrap(
            children: controller.availableGenres.keys.map((item) {
              if (controller.availableGenres[item]!) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12, right: 12),
                  child: PrimaryContainer(
                    child: Text(
                      item.capitalize!,
                      style: AppTypography.subHeading1,
                    ),
                    onTap: () => controller.toggleGenreFilter(item),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 12, right: 12),
                child: SecondaryContainer(
                  child: Text(
                    item.capitalize!,
                    style: AppTypography.subHeading1,
                  ),
                  onTap: () => controller.toggleGenreFilter(item),
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
