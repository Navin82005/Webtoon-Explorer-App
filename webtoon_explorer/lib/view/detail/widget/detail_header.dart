import 'package:flutter/material.dart';

import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/model/manga.dart';
import 'package:webtoon_explorer/view/widget/image_widget.dart';
import 'package:webtoon_explorer/view/widget/rating.dart';

class DetailHeader extends StatelessWidget {
  final Manga mangaData;
  final String genre;
  const DetailHeader({super.key, required this.mangaData, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.primaryBackground,
            AppColors.primaryBackground,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 2,
              child: Hero(
                tag: "${mangaData.title}-$genre",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: ImageWidget(
                    image: mangaData.image,
                    height: 120,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    mangaData.title,
                    style: AppTypography.heading1,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                  ),
                  Row(
                    children: [
                      Text("Rated for ", style: AppTypography.body1),
                      Rating(
                        rating: mangaData.rating,
                        style: AppTypography.body1,
                      ),
                    ],
                  ),
                  Text("", style: AppTypography.body1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
