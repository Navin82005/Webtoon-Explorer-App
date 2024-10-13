import 'package:get/get.dart';
import 'package:webtoon_explorer/controller/filter_controller.dart';

class StatusFilterController extends GetxController {
  var availableStatus = <String, bool>{}.obs;
  var statusFilterCount = 0.obs;

  // Fetches the available status and initializes the availableStatus map with false
  void fetchAvailableStatus() {
    var filterController = Get.find<FilterController>();
    var status = filterController.availableStatus;

    availableStatus.clear(); // Clear any existing data to avoid duplication
    availableStatus.addAll({
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
    // print("Genre Filter Count: ${statusFilterCount.value}");
  }

  // Handles toggling of all status on or off
  void _toggleAllGenres() {
    var isAllSelected = availableStatus["all"] ?? false;

    if (!isAllSelected) {
      // Select all status
      availableStatus.updateAll((key, value) => true);
      statusFilterCount.value =
          availableStatus.length; // All status are selected
    } else {
      // Deselect all status
      availableStatus.updateAll((key, value) => false);
      statusFilterCount.value = 0; // No status selected
    }
  }

  // Handles toggling a single state
  void _toggleSingleGenre(String state) {
    if (!availableStatus.containsKey(state))
      return; // Skip if the state does not exist

    var isSelected = availableStatus[state] ?? false;

    // Update the state's selection state
    availableStatus[state] = !isSelected;

    // Update the statusFilterCount based on the new selection state
    if (!isSelected) {
      statusFilterCount.value += 1;
    } else {
      if (statusFilterCount.value == availableStatus.keys.length) {
        statusFilterCount.value -= 1;
      }
      statusFilterCount.value -= 1;
    }

    // If all status except "all" are selected, set "all" to true
    if (statusFilterCount.value == availableStatus.keys.length - 1) {
      availableStatus["all"] = true;
    } else {
      availableStatus["all"] = false;
    }
  }

  List<String> getFilters() {
    List<String> result = [];
    for (var i in availableStatus.keys) {
      if (availableStatus[i]!) {
        result += [i];
      }
    }
    return result;
  }

  void clearFilter() {
    for (var element in availableStatus.keys) {
      availableStatus[element] = false;
    }

    statusFilterCount.value = 0;
  }
}
