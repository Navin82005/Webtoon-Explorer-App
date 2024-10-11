import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:webtoon_explorer/controller/home_page_controller.dart';
import 'package:webtoon_explorer/view/home/widget/section.dart';

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
    _homePageController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetX<HomePageController>(builder: (controller) {
        if (controller.isLoading.value) {
          return Center(
            child: Lottie.asset("assets/animation/loader.json"),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.genres.length,
          itemBuilder: (context, index) => Section(
            title: controller.genres[index].capitalize!,
            mangaData: controller.manga[index],
          ),
        );
      }),
    );
  }
}
