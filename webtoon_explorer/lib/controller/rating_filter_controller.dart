import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/filter_controller.dart';

class RatingFilterController extends GetxController {
  var availableRatings = <String, bool>{}.obs;
  var ratingFilterCount = 0.obs;

  // Fetches the available status and initializes the availableRatings map with false
  void fetchAvailableStatus() {
    var filterController = Get.find<FilterController>();
    var status = filterController.availableRatings;

    availableRatings.clear(); // Clear any existing data to avoid duplication
    availableRatings.addAll({
      for (var state in status) state: false
    }); // Initializes all status to false
  }

  // Toggles the state filter state, including "all" functionality
  void toggleGenreFilter(String state) {
    if (state == "all") {
      _toggleAllGenres();
    } else {
      _toggleSingleGenre(state);
    }
    // print("Genre Filter Count: ${ratingFilterCount.value}");
  }

  // Handles toggling of all status on or off
  void _toggleAllGenres() {
    var isAllSelected = availableRatings["all"] ?? false;

    if (!isAllSelected) {
      // Select all status
      availableRatings.updateAll((key, value) => true);
      ratingFilterCount.value =
          availableRatings.length; // All status are selected
    } else {
      // Deselect all status
      availableRatings.updateAll((key, value) => false);
      ratingFilterCount.value = 0; // No status selected
    }
  }

  // Handles toggling a single state
  void _toggleSingleGenre(String state) {
    if (!availableRatings.containsKey(state))
      return; // Skip if the state does not exist

    var isSelected = availableRatings[state] ?? false;

    // Update the state's selection state
    availableRatings[state] = !isSelected;

    // Update the ratingFilterCount based on the new selection state
    if (!isSelected) {
      ratingFilterCount.value += 1;
    } else {
      if (ratingFilterCount.value == availableRatings.keys.length) {
        ratingFilterCount.value -= 1;
      }
      ratingFilterCount.value -= 1;
    }

    // If all status except "all" are selected, set "all" to true
    if (ratingFilterCount.value == availableRatings.keys.length - 1) {
      availableRatings["all"] = true;
    } else {
      availableRatings["all"] = false;
    }
  }

  bool checkMatch(String rating, String pattern) {
    double ratingValue = double.parse(rating);

    switch (pattern) {
      case "1 - 2":
        return ratingValue >= 1 && ratingValue <= 2;
      case "2 - 3":
        return ratingValue > 2 && ratingValue <= 3;
      case "3 - 4":
        return ratingValue > 3 && ratingValue <= 4;
      case "4 - 5":
        return ratingValue > 4 && ratingValue <= 5;
      case "above 4":
        return ratingValue > 4;
      case "all":
        return true; // Match for all ratings
      default:
        return false; // If an unknown pattern is provided
    }
  }

  List<String> getFilters() {
    List<String> result = [];
    for (var i in availableRatings.keys) {
      if (availableRatings[i]!) {
        result += [i];
      }
    }
    return result;
  }

  void clearFilter() {
    for (var i in availableRatings.keys) {
      availableRatings[i] = false;
    }

    ratingFilterCount.value = 0;
  }
}
