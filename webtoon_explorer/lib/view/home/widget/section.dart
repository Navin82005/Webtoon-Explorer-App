import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/model/manga.dart';
import 'package:webtoon_explorer/view/home/widget/view_card.dart';

class Section extends StatelessWidget {
  final String title;
  final Manga mangaData;
  const Section({super.key, required this.title, required this.mangaData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTypography.heading2),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                ViewCard(mangaData: mangaData),
                ViewCard(mangaData: mangaData),
                ViewCard(mangaData: mangaData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
