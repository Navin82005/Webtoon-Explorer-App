import 'package:get/get.dart';
import 'package:webtoon_explorer/view/favorite/favorite.dart';
import 'package:webtoon_explorer/view/home/home.dart';
import 'package:webtoon_explorer/view/profile/profile.dart';
import 'package:webtoon_explorer/view/search/search.dart';

class NavigationController extends GetxController {
  var currentPage = 0.obs;
  var pages = [
    const Home(),
    const Search(),
    const Favorite(),
    const Profile(),
  ];

  setActivePageIndex(int index) {
    currentPage.value = index;
    update();
  }
}
