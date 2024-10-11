import 'package:get/get.dart';
import 'package:webtoon_explorer/view/home/home.dart';

class NavigationController extends GetxController {
  var currentPage = 0.obs;
  var pages = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
  ];
}
