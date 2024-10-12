import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/favorite_controller.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/favorite/widget/favorite_card.dart';
import 'package:webtoon_explorer/view/home/widget/view_card.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late FavoriteController _favoriteController;

  @override
  void initState() {
    super.initState();
    _favoriteController = Get.find<FavoriteController>();
    _favoriteController.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("My Favorites", style: AppTypography.heading1),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: GetX<FavoriteController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ListView.builder(
              itemCount: controller.favoriteManga.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: FavoriteCard(
                  mangaData: controller.favoriteManga[index],
                  genre: controller.favoriteManga[index].genre[0],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
