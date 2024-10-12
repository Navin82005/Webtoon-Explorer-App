import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/favorite_controller.dart';

import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/model/manga.dart';

class DetailHeaderBar extends StatelessWidget {
  final Manga data;
  const DetailHeaderBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.fontColor,
                    size: AppTypography.heading1.fontSize! + 5,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                var controller = Get.find<FavoriteController>();
                if (controller.checkIsInFavorites(title: data.title)) {
                  controller.removeFromFavorites(title: data.title);
                } else {
                  controller.addToFavorites(manga: data);
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GetX<FavoriteController>(
                    builder: (controller) {
                      if (controller.checkIsInFavorites(title: data.title)) {
                        return Icon(
                          Icons.favorite,
                          color: AppColors.primaryForeground,
                          size: AppTypography.heading1.fontSize! + 5,
                        );
                      } else {
                        return Icon(
                          Icons.favorite_border,
                          color: AppColors.fontColor,
                          size: AppTypography.heading1.fontSize! + 5,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
