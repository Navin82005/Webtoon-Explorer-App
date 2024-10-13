import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/genre_filter_controller.dart';
import 'package:webtoon_explorer/controller/home_page_controller.dart';
import 'package:webtoon_explorer/controller/rating_filter_controller.dart';
import 'package:webtoon_explorer/controller/status_filter_controller.dart';
import 'package:webtoon_explorer/model/manga.dart';

class FilterController extends GetxController {
  var isFilterActive = false.obs;
  var isFilterOpened = false.obs;
  var isLoading = false.obs;

  var selectedFilters = 0.obs;
  var keyword = "".obs;

  var result = <Manga>[].obs;
  var activeFilters = <String>[].obs;
  var allActiveFilters = <String>[].obs;

  var availableGenres = [
    "all",
    "action",
    "drama",
    "romance",
    "horror",
    "fantasy",
    "thriller"
  ];

  var availableStatus = ["all", "ongoing", "completed", "upcoming"];

  var availableRatings = ["all", "1 - 2", "2 - 3", "3 - 4", "4 - 5", "above 4"];

  setFilter() {
    allActiveFilters.clear();
    // Checking if genre filter is selected and updating the values
    var genreController = Get.find<GenreFilterController>();

    if (genreController.genreFilterCount.value > 0) {
      print("genreController Value: ${genreController.getFilters()}");
      allActiveFilters.addAll(genreController.getFilters());
      if (!activeFilters.contains("genre")) activeFilters.add("genre");
    } else if (genreController.genreFilterCount.value == 0) {
      activeFilters.remove("genre");
    }

    // Checking if status filter is selected and updating the values
    var statusController = Get.find<StatusFilterController>();
    if (statusController.statusFilterCount.value > 0) {
      allActiveFilters.addAll(statusController.getFilters());
      if (!activeFilters.contains("status")) activeFilters.add("status");
    } else if (statusController.statusFilterCount.value == 0) {
      activeFilters.remove("status");
    }

    // Checking if rating filter is selected and updating the values
    var ratingController = Get.find<RatingFilterController>();
    if (ratingController.ratingFilterCount.value > 0) {
      allActiveFilters.addAll(ratingController.getFilters());
      if (!activeFilters.contains("rating")) activeFilters.add("rating");
    } else if (ratingController.ratingFilterCount.value == 0) {
      activeFilters.remove("rating");
    }

    // print("Filters Selected: ${selectedFilters.value}");
    // print("Filters: ${activeFilters.value}");

    selectedFilters.value = activeFilters.length;

    if (selectedFilters.value > 0) {
      isFilterActive.value = true;
    } else {
      isFilterActive.value = false;
    }
    update();
  }

  fetchResult() async {
    isLoading.value = true;
    print("Setting Filter");
    Get.find<FilterController>().setFilter();
    result.clear();
    await Future.delayed(const Duration(seconds: 1));
    var mangaController = Get.find<HomePageController>();

    bool keyMatch = false;
    bool genreMatch = false;
    bool statusMatch = false;
    bool ratingMatch = false;

    // Fetching filter values directly in this method
    var genreFilterData = <String>[];
    var statusFilterData = <String>[];
    var ratingFilterData = <String>[];

    // Genre filter values
    var genreController = Get.find<GenreFilterController>();
    for (var i in genreController.availableGenres.keys) {
      if (genreController.availableGenres[i]!) {
        genreFilterData.add(i);
      }
    }

    // Status filter values
    var statusController = Get.find<StatusFilterController>();
    for (var i in statusController.availableStatus.keys) {
      if (statusController.availableStatus[i]!) {
        statusFilterData.add(i);
      }
    }

    // Rating filter values
    var ratingController = Get.find<RatingFilterController>();
    for (var i in ratingController.availableRatings.keys) {
      if (ratingController.availableRatings[i]!) {
        ratingFilterData.add(i);
      }
    }

    for (var manga in mangaController.manga) {
      // Check genre match
      genreMatch = genreFilterData.isEmpty ||
          manga.genre.any((mG) => genreFilterData.contains(mG));

      // Check status match (Assuming manga.status is available)
      statusMatch = statusFilterData.isEmpty ||
          statusFilterData.contains(manga.dateOfRelease);

      // Check rating match (Assuming manga.rating is available)
      if (ratingFilterData.isNotEmpty) {
        for (var rating in ratingFilterData) {
          ratingMatch = ratingController.checkMatch(manga.rating, rating);
          if (ratingMatch == true) break;
        }
      } else {
        ratingMatch = ratingFilterData.isEmpty;
      }

      // Check if title contains keyword
      keyMatch = manga.title.isCaseInsensitiveContainsAny(keyword.value);

      // Add manga to results if it matches all active filters
      if (keyMatch && genreMatch && statusMatch && ratingMatch) {
        result.add(manga);
      }
    }

    isLoading.value = false;
  }

  clearFilters() {
    Get.find<GenreFilterController>().clearFilter();
    Get.find<StatusFilterController>().clearFilter();
    Get.find<RatingFilterController>().clearFilter();
    isFilterActive.value = false;
    activeFilters.clear();
    result.clear();
    allActiveFilters.clear();
    selectedFilters.value = 0;
  }
}
