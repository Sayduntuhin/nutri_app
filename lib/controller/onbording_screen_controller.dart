import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:nutri_app/model/weight.dart';

class OnboardingData{
  String? gender;
  String? activityLevel;
  Country? country;
  String? askPage;
  double? height;

  Weight weight = Weight();

  DateTime? birthdate;
  String? targetGoal;

  double? desiredWeight;

  List<DateTime> mealTimings = [];

  String? targetSpeed;

  String? dietType;

  String? achieveGoal;

}

class GenderSelectionController extends GetxController {
  var selectedGender = Rx<String?>(null);

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  bool isGenderSelected() {
    return selectedGender.value != null;
  }
}

class ActivityLevelSelectionController extends GetxController {
  var selectedActivityLevel = Rx<String?>(null);

  void setActivityLevel(String level) {
    selectedActivityLevel.value = level;
  }

  bool isActivityLevelSelected() {
    return selectedActivityLevel.value != null;
  }
}

class CountrySelectionController extends GetxController {
  var selectedCountry = Rx<String?>(null);
  var selectedFlag = Rx<String?>(null);

  bool get isCountrySelected => selectedCountry.value != null;

  void selectCountry(String country, String flag) {
    selectedCountry.value = country;
    selectedFlag.value = flag;
  }
}
class AskPageController extends GetxController {
  var selectedAskPage = Rx<String?>(null);

  void setAskPage(String answer) {
    selectedAskPage.value = answer;
  }

  bool isAskPageSelected() {
    return selectedAskPage.value != null;
  }
}


// In HeightPageController (or appropriate controller)
class HeightPageController extends GetxController {
  var isHeightChanged = false.obs;
  var selectedHeight = 0.obs; // Track selected height (or use double for more precision)

  // This will be triggered when the user selects height
  void setHeightChanged(bool value) {
    isHeightChanged.value = value;
  }

  void updateHeight(int height) {
    selectedHeight.value = height;
    setHeightChanged(true); // Mark as changed
  }
}
class WeightController extends GetxController {
  var weight = 0.0.obs; // Observable weight
  String selectedUnit = "Kilogram";

  void setWeight(double value) {
    weight.value = value;
  }

  void setUnit(String unit) {
    selectedUnit = unit;
  }

  String get weightDisplay {
    if (selectedUnit == "Pounds") {
      return "${(weight.value * 2.20462).toStringAsFixed(2)} lbs"; // Convert kg to pounds
    } else {
      return "${weight.value} kg";
    }
  }
}

class DatePickerController extends GetxController {
  // Observables to track the selected date and whether a date is selected
  var selectedDate = DateTime.now().obs;
  var isDateSelected = false.obs;

  // You can add methods here to manipulate the selectedDate if needed
  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
    isDateSelected.value = true; // Mark that a date is selected
  }

  // Reset the date selection
  void resetDateSelection() {
    selectedDate.value = DateTime.now(); // Reset to current date
    isDateSelected.value = false; // Mark that no date is selected
  }
}

class AchievingYourGoalController extends GetxController {
  var selectedGoal = Rx<String?>(null);

  void selectGoal(String goal) {
    print('Goal selected: $goal'); // Debugging line

    selectedGoal.value = goal;
  }

  bool get isGoalSelected => selectedGoal.value != null;
}


