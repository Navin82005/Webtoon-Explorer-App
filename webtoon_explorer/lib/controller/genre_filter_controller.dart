import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/filter_controller.dart';

class GenreFilterController extends GetxController {
  var availableGenres = <String, bool>{}.obs;
  var genreFilterCount = 0.obs;

  // Fetches the available genres and initializes the availableGenres map with false
  void fetchAvailableGenres() {
    var filterController = Get.find<FilterController>();
    var genres = filterController.availableGenres;

    availableGenres.clear(); // Clear any existing data to avoid duplication
    availableGenres.addAll({
      for (var genre in genres) genre: false
    }); // Initializes all genres to false
  }

  // Toggles the genre filter state, including "all" functionality
  void toggleGenreFilter(String genre) {
    if (genre == "all") {
      _toggleAllGenres();
    } else {
      _toggleSingleGenre(genre);
    }
    // print("Genre Filter Count: ${genreFilterCount.value}");
  }

  // Handles toggling of all genres on or off
  void _toggleAllGenres() {
    var isAllSelected = availableGenres["all"] ?? false;

    if (!isAllSelected) {
      // Select all genres
      availableGenres.updateAll((key, value) => true);
      genreFilterCount.value =
          availableGenres.length; // All genres are selected
    } else {
      // Deselect all genres
      availableGenres.updateAll((key, value) => false);
      genreFilterCount.value = 0; // No genres selected
    }
  }

  // Handles toggling a single genre
  void _toggleSingleGenre(String genre) {
    if (!availableGenres.containsKey(genre)) {
      return; // Skip if the genre does not exist
    }

    var isSelected = availableGenres[genre] ?? false;

    // Update the genre's selection state
    availableGenres[genre] = !isSelected;

    // Update the genreFilterCount based on the new selection state
    if (!isSelected) {
      genreFilterCount.value += 1;
    } else {
      if (genreFilterCount.value == availableGenres.keys.length) {
        genreFilterCount.value -= 1;
      }
      genreFilterCount.value -= 1;
    }

    // If all genres except "all" are selected, set "all" to true
    if (genreFilterCount.value == availableGenres.keys.length - 1) {
      availableGenres["all"] = true;
    } else {
      availableGenres["all"] = false;
    }
  }

  List<String> getFilters() {
    List<String> result = [];
    for (var i in availableGenres.keys) {
      if (availableGenres[i]!) {
        result += [i];
        print("Filters: $i");
      }
    }
    return result;
  }

  void clearFilter() {
    for (var i in availableGenres.keys) {
      availableGenres[i] = false;
    }
    genreFilterCount.value = 0;
  }
}
