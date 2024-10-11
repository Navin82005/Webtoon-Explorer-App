import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/model/manga.dart';

class ViewCard extends StatelessWidget {
  final Manga mangaData;
  const ViewCard({super.key, required this.mangaData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              width: 150,
              height: 200,
              imageUrl: mangaData.image,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: Lottie.asset("assets/animation/loader.json"),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  mangaData.title,
                  style: AppTypography.body1,
                  overflow: TextOverflow.clip,
                ),
              ),
              // const SizedBox(width: 20),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.primaryForeground,
                    size: AppTypography.body1.fontSize,
                  ),
                  Text(mangaData.rating, style: AppTypography.body1),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
