import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/model/manga.dart';
import 'package:webtoon_explorer/view/detail/widget/author_description.dart';
import 'package:webtoon_explorer/view/detail/widget/description_section.dart';
import 'package:webtoon_explorer/view/detail/widget/detail_bar.dart';
import 'package:webtoon_explorer/view/detail/widget/detail_header.dart';
import 'package:webtoon_explorer/view/detail/widget/genre_section.dart';
import 'package:webtoon_explorer/view/widget/image_widget.dart';
import 'package:webtoon_explorer/view/widget/primary_button.dart';

class Detail extends StatelessWidget {
  final Manga mangaData;
  final String genre;
  const Detail({super.key, required this.mangaData, required this.genre});

  @override
  Widget build(BuildContext context) {
    print("mangaData.banner == "
        " ? mangaData.image : mangaData.banner, ${mangaData.banner}");
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(toolbarHeight: 5, backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Column(
            children: [
              const SafeArea(child: SizedBox.shrink()),
              ImageWidget(
                image:
                    mangaData.banner == "" ? mangaData.image : mangaData.banner,
              ),
            ],
          ),
          ListView(
            children: [
              DetailHeaderBar(data: mangaData),
              const SizedBox(height: 110),
              DetailHeader(mangaData: mangaData, genre: genre),
              Container(
                color: AppColors.primaryBackground,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    GenreSection(genres: mangaData.genre),
                    const SizedBox(height: 12),
                    DescriptionSection(descriptions: mangaData.description),
                    const SizedBox(height: 12),
                    AuthorDescription(authors: mangaData.creator),
                    const SizedBox(height: 18),
                    PrimaryButton(
                      width: Get.width,
                      onTap: () => print("Opening ${mangaData.title}"),
                      text: "Read Manhwa",
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
