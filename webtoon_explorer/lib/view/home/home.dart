import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webtoon_explorer/controller/favorite_controller.dart';
import 'package:webtoon_explorer/controller/home_page_controller.dart';
import 'package:webtoon_explorer/view/home/widget/home_app_bar.dart';
import 'package:webtoon_explorer/view/home/widget/section.dart';
import 'package:webtoon_explorer/view/widget/loader_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomePageController _homePageController;

  @override
  void initState() {
    super.initState();
    _homePageController = Get.put(HomePageController());
    Get.find<FavoriteController>().loadFavorites();
    _homePageController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   elevation: 0,
      //   surfaceTintColor: Colors.transparent,
      //   title: Text("Toon Gala", style: AppTypography.heading1),
      // ),
      body: GetX<HomePageController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const LoaderWidget();
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.genres.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const HomeAppBar();
              }
              if (index == 1) {
                return const PapularSection();
              }
              return Section(
                title: controller.genres[index - 2].capitalize!,
              );
            },
          );
        },
      ),
    );
  }
}
