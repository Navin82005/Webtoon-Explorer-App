import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/favorite_controller.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/model/manga.dart';
import 'package:webtoon_explorer/view/detail/detail.dart';
import 'package:webtoon_explorer/view/widget/image_widget.dart';
import 'package:webtoon_explorer/view/widget/rating.dart';

class ViewCard extends StatelessWidget {
  final Manga mangaData;
  final String genre;
  final bool enableOverlay;
  const ViewCard({
    super.key,
    required this.mangaData,
    required this.genre,
    this.enableOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: GestureDetector(
              onTap: () => Get.to(
                () => Detail(mangaData: mangaData, genre: genre),
                // transition: Transition.downToUp,
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: "${mangaData.title}-$genre",
                    child: ImageWidget(
                      width: 150,
                      height: 200,
                      image: mangaData.image,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8, top: 8),
                      child: GetX<FavoriteController>(
                        builder: (controller) {
                          if (controller.checkIsInFavorites(
                            title: mangaData.title,
                          )) {
                            return Icon(
                              Icons.favorite,
                              color: AppColors.primaryForeground,
                              size: AppTypography.heading1.fontSize! + 5,
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  if (mangaData.category.toLowerCase() == "popular" &&
                      genre != "popular")
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.primaryForeground,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 5, bottom: 5, right: 8),
                          child: Text(
                            "Popular",
                            style: AppTypography.body1,
                          ),
                        ),
                      ),
                    )
                  else if (enableOverlay)
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.primaryForeground,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, top: 5, bottom: 5, right: 8),
                          child: Text(
                            genre.capitalize!,
                            style: AppTypography.body1,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  mangaData.title,
                  style: AppTypography.body1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // const SizedBox(width: 20),
              Rating(rating: mangaData.rating, style: AppTypography.body1),
            ],
          )
        ],
      ),
    );
  }
}
