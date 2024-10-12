import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/controller/home_page_controller.dart';
import 'package:webtoon_explorer/model/manga.dart';
import 'package:webtoon_explorer/view/home/widget/view_card.dart';

class RenderSection extends StatelessWidget {
  final String genre;
  const RenderSection({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final List<Manga> genreData =
        Get.find<HomePageController>().getGenreData(genre);
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: genreData.length,
      itemBuilder: (BuildContext context, int index) {
        return ViewCard(mangaData: genreData[index], genre: genre);
      },
    );
  }
}

class RenderPapularSection extends StatelessWidget {
  const RenderPapularSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Manga> data = Get.find<HomePageController>().papular.value;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ViewCard(mangaData: data[index], genre: "popular");
      },
    );
  }
}
