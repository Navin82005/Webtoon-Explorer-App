import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:webtoon_explorer/core/conf/app_colors.dart';
import 'package:webtoon_explorer/model/manga.dart';

class FavoriteController extends GetxController {
  var favoriteManga = <Manga>[].obs;
  final box = Hive.box<Manga>("favorites");

  void loadFavorites() {
    favoriteManga.clear();
    print("loading favorites...");
    for (var i in box.keys) {
      favoriteManga += [box.get(i)!];
      print(box.get(i)!);
    }
  }

  bool checkIsInFavorites({required String title}) {
    for (var element in favoriteManga) {
      if (element.title == title) {
        return true;
      }
    }
    return false;
  }

  bool checkIsAddedToFavorites({required String title}) {
    if (box.keys.contains(title)) {
      return true;
    }
    return false;
  }

  removeFromFavorites({required String title}) {
    box.delete(title);
    for (var i in favoriteManga) {
      if (i.title == title) {
        favoriteManga.remove(i);
      }
    }
    Get.snackbar(
      "Info",
      "Removed $title from Favorites",
      colorText: AppColors.fontColor,
      backgroundColor: AppColors.primaryBackground,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 3,
      dismissDirection: DismissDirection.horizontal,
      margin: EdgeInsets.zero,
    );
    update();
  }

  void addToFavorites({required Manga manga}) {
    print("Added ${manga.title} to Your Favorites");
    if (checkIsAddedToFavorites(title: manga.title)) {
      Get.snackbar(
        "Info",
        "${manga.title} is already in favorites",
        colorText: AppColors.fontColor,
        backgroundColor: AppColors.primaryBackground,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 3,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.zero,
      );
    } else {
      favoriteManga.add(manga);
      box.put(manga.title, manga);
      Get.snackbar(
        "Info",
        "Added ${manga.title} to Favorites",
        colorText: AppColors.fontColor,
        backgroundColor: AppColors.primaryBackground,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 3,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.zero,
      );
    }
    update();
  }
}
