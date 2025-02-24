import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/onbording/child/pages/ask_page.dart';
import 'package:nutri_app/views/onbording/child/pages/desire_weight.dart';
import 'package:nutri_app/views/onbording/child/pages/diet_type_page.dart';
import 'package:nutri_app/views/onbording/child/pages/height_page.dart';
import 'package:nutri_app/views/onbording/child/pages/meal%20_timing_page.dart';
import 'package:nutri_app/views/onbording/child/pages/target_page.dart';
import 'package:nutri_app/views/onbording/child/pages/thanks_page.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:path/path.dart';
import '../../../controller/onbording_screen_controller.dart';
import '../../widgets/custom_app_bar.dart';
import '../child/pages/achieving_your_goal_page.dart';
import '../child/pages/appropriate_time_page.dart';
import '../child/pages/choose_goal_page.dart';
import '../child/pages/contry_select_page.dart';
import '../child/pages/date_pick_page.dart';
import '../child/pages/gender_page.dart';
import '../child/pages/physical_activity_level_page.dart';
import '../child/pages/weight_page.dart';

class MultiStepPageController extends GetxController {
  final onboardingData = OnboardingData().obs;

  final currentPage = 0.obs;

  double get progress => (currentPage.value / 14.toDouble());

  final List<Widget> pages = [
    GenderSelectionPage(
      isOnboarding: true,
    ),
    PhysicalActivityLevelPage(),
    CountrySelectionPage(),
    AskPage(),
    HeightPage(
      isOnboarding: true,
    ),
    WeightPage(
      isOnboarding: true,
    ),
    DatePickerPage(
      isOnboarding: true,
    ),
    ChooseGoalPage(),
    AppropriateTimePage(),
    DesireWeightPage(
      isOnboarding: true,
    ),
    MealTimingPage(
      isOnboarding: true,
    ),
    TargetPage(
      isOnboarding: true,
    ),
    DietTypePage(),
    AchievingYourGoalPage(),
    ThanksPage()
  ];

  bool get isDone {
    switch (currentPage.value) {
      case 0: // Page 0: Gender selection
        return onboardingData.value.gender != null;

      case 1: // Page 1: Activity Level selection
        return onboardingData.value.activityLevel != null;

      case 2: // Page 2: Country selection
        return onboardingData.value.country != null;

      case 3: // Page 3: Ask Page data
        return onboardingData.value.askPage != null;

      case 4: // Page 4: Height selection
        // return onboardingData.value.height != null;
        return true;

      case 5: // Page 5: Weight selection
        return onboardingData.value.weight.weight != null;

      case 6: // Page 6: Birthdate selection
        return onboardingData.value.birthdate != null;

      case 7: // Page 7: Target Goal selection
        return onboardingData.value.targetGoal != null;

      case 8: // Page 8: Appropriated Time selection
        return true;

      case 9: // Page 9: desired Weight selection
        return onboardingData.value.desiredWeight != null;

      case 10: // Page 10: meal timings selection
        return onboardingData.value.mealTimings.isNotEmpty;

      case 11: // Page 11: target Speed selection
        return onboardingData.value.targetSpeed != null;

      case 12: // Page 12: Diet Type selection
        return onboardingData.value.dietType != null;

      case 13: // Page 12: Achieving Goal selection
        return onboardingData.value.achieveGoal != null;
        return onboardingData.value.achieveGoal != null;

      default:
        return false; // If no matching page
    }
  }
}

class MultiStepPage extends StatelessWidget {
  const MultiStepPage({super.key});

//   const MultiStepPage({super.key});
//
//   @override
//   State<MultiStepPage> createState() => _MultiStepPageState();
// }
//
// class _MultiStepPageState extends State<MultiStepPage> {
//   void initState() {
//     super.initState();
//     // Initialize the controller here if it isn't already initialized
//     if (!Get.isRegistered<AchievingYourGoalController>()) {
//       Get.put(AchievingYourGoalController());
//     }
//   }
//   int currentPage = 0;
//   double progress = 0.07;
//   String? selectedGender;
//   String? selectedActivityLevel;
//   bool isGenderSelected = false;
//   bool isActivityLevelSelected = false;
//   final GenderSelectionController genderController = Get.put(GenderSelectionController());
//   final ActivityLevelSelectionController activityLevelController = Get.put(ActivityLevelSelectionController());
//   final CountrySelectionController countryController = Get.put(CountrySelectionController());
//   final AskPageController askPageController = Get.put(AskPageController());
//   final HeightPageController heightController = Get.put(HeightPageController());
//   final WeightController weightController = Get.put(WeightController());
//   final DatePickerController datePickerController = Get.put(DatePickerController());
//   final AchievingYourGoalController achievingYourGoalController = Get.put(AchievingYourGoalController());
//
//

//
//   void onNext() {
//     if (currentPage < pages.length - 1) {
//       setState(() {
//         currentPage++;
//         progress = (currentPage + 1) /
//             pages
//                 .length;
//       });
//     } else {
//       setState(() {
//         progress = 1.0;
//       });
//       context.push("/recommendation");
//     }
//   }
//
//   bool _isFormValid() {
//     if (currentPage == 0) {
//       return genderController
//           .isGenderSelected();
//     } else if (currentPage == 1) {
//       return activityLevelController
//           .isActivityLevelSelected();
//     } else if (currentPage == 2) {
//       return countryController.isCountrySelected;
//     }
//     else if (currentPage == 3) {
//       return   askPageController.isAskPageSelected();
//     }
//     else  if (currentPage == 4) { // Assuming the height page is at index 4
//       return heightController.isHeightChanged.value;
//     }
//     else if (currentPage == 5) {  // For Weight Page
//       return weightController.weight.value > 0;  // Ensure weight is entered
//     }
//     else if (currentPage == 6) {  // For Weight Page
//       return datePickerController.isDateSelected.value;
//     }
//     // else if (currentPage == 7) {
//     //   // Check if a goal is selected (only enable Next when goal is selected)
//     //   // return achievingYourGoalController.selectedGoal.value != null;
//     // }
//     return true;
//   }
//
  void onBack(BuildContext context, MultiStepPageController controller) {
    if (controller.currentPage.value > 0) {
      controller.currentPage.value--;
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MultiStepPageController(),
        builder: (controller) {
          return PopScope(
            canPop: true,
            onPopInvokedWithResult: (result, _) {
              onBack(context, controller);
            },
            child: Obx(
              () => Scaffold(
                resizeToAvoidBottomInset: true,
                appBar: CustomAppBar(
                  progress: controller.progress,
                  onBackPressed: () => onBack(context, controller),
                ),
                body: Obx(
                  () => Column(
                    children: [
                      Expanded(
                        child: controller.pages[controller.currentPage.value],
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Obx(() {
                      return CustomButton(
                        text: controller.currentPage.value ==
                                controller.pages.length - 1
                            ? "Develop your plan"
                            : "Next",
                        onPressed: () {
                          if (controller.isDone) {
                            controller.currentPage.value++;
                          }
                        },
                        disableButton: !controller.isDone,
                      );
                    }),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
