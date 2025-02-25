import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:nutri_app/model/weight.dart';

class MealTiming {
  final String meal;
  final DateTime? time;

  MealTiming(this.meal, this.time);

  MealTiming copyWith({
    String? meal,
    DateTime? time,
  }) {
    return MealTiming(
      meal ?? this.meal,
      time ?? this.time,
    );
  }

  @override
  String toString() {
    return 'MealTiming{meal: $meal, time: $time}';
  }
}

class Speed {

  final String speed;
  final double value;

  Speed(this.speed, this.value);

  Speed copyWith({
    String? speed,
    double? value,
  }) {
    return Speed(
      speed ?? this.speed,
      value ?? this.value,
    );
  }

  @override
  String toString() {
    return 'Speed{speed: $speed, value: $value}';
  }
}

class OnboardingData {
  String? gender;
  String? activityLevel;
  Country? country;
  String? askPage;
  double? height;
  Weight weight = Weight();
  DateTime? birthdate;
  String? chooseGoal;
  Weight desiredWeight = Weight();

  List<MealTiming> mealTimings = [
    MealTiming("Breakfast", null),
    MealTiming("Lunch", null),
    MealTiming("Dinner", null),
    MealTiming("Snacks", null),
  ];

  Speed targetSpeed = Speed("Slow", 0.0);

  String? dietType;

  String? achieveGoal;

  bool hasNullOrZeroTime() {
    for (var mealTiming in mealTimings) {
      if (mealTiming.time == null) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    return 'OnboardingData{gender: $gender, activityLevel: $activityLevel, country: ${country?.toJson()}, askPage: $askPage, height: $height, weight: $weight, birthdate: $birthdate, chooseGoal: $chooseGoal, desiredWeight: $desiredWeight, mealTimings: $mealTimings, targetSpeed: $targetSpeed, dietType: $dietType, achieveGoal: $achieveGoal}';
  }
}
// In HeightPageController (or appropriate controller)
class HeightPageController extends GetxController {
  var isHeightChanged = false.obs;
  var selectedHeight =
      0.obs; // Track selected height (or use double for more precision)

  // This will be triggered when the user selects height
  void setHeightChanged(bool value) {
    isHeightChanged.value = value;
  }

  void updateHeight(int height) {
    selectedHeight.value = height;
    setHeightChanged(true); // Mark as changed
  }
}

