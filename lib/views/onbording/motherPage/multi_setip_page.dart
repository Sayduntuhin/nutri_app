import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/onbording/child/pages/ask_page.dart';
import 'package:nutri_app/views/onbording/child/pages/desire_weight.dart';
import 'package:nutri_app/views/onbording/child/pages/diet_type_page.dart';
import 'package:nutri_app/views/onbording/child/pages/height_page.dart';
import 'package:nutri_app/views/onbording/child/pages/meal%20_timing_page.dart';
import 'package:nutri_app/views/onbording/child/pages/target_page.dart';
import 'package:nutri_app/views/onbording/child/pages/thanks_page.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../child/pages/achieving_your_goal_page.dart';
import '../child/pages/appropriate_time_page.dart';
import '../child/pages/choose_goal_page.dart';
import '../child/pages/contry_select_page.dart';
import '../child/pages/date_pick_page.dart';
import '../child/pages/gender_page.dart';
import '../child/pages/physical_activity_level_page.dart';
import '../child/pages/weight_page.dart';

class MultiStepPage extends StatefulWidget {
  const MultiStepPage({super.key});

  @override
  State<MultiStepPage> createState() => _MultiStepPageState();
}

class _MultiStepPageState extends State<MultiStepPage> {
  int currentPage = 0; // Track the current page index
  double progress = 0.07; // Start the progress
  String? selectedGender;
  String? selectedActivityLevel;
  bool isGenderSelected = false; // Track if gender is selected
  bool isActivityLevelSelected = false; // Track if activity level is selected

  final List<Widget> pages = [
    GenderSelectionPage(isOnboarding: true,),
    PhysicalActivityLevelPage(),
    CountrySelectionPage(),
    AskPage(),
    HeightPage(isOnboarding: true,),
    WeightPage(isOnboarding: true,),
    DatePickerPage(isOnboarding: true,),
    ChooseGoalPage(),
    AppropriateTimePage(),
    DesireWeightPage(isOnboarding: true,),
    MealTimingPage(isOnboarding: true,),
    TargetPage(isOnboarding: true,),
    DietTypePage(),
    AchievingYourGoalPage(),
    ThanksPage()
  ];

  void onNext() {
    if (currentPage < pages.length - 1) {
      setState(() {
        currentPage++;
        progress = (currentPage + 1) / pages.length; // Update progress incrementally (divide by total pages)
      });
    } else {
      setState(() {
        // When user reaches the last page, change the button text
        progress = 1.0; // Ensure the progress is 100%
      });
      context.push("/recommendation");
     /* Navigator.push(
        context,
        MaterialPageRoute(builder: (con), // Replace with your desired page
      );*/
    }
  }

  void onBack() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        progress = (currentPage + 1) / pages.length; // Update progress when going back
      });
    } else if (currentPage == 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        progress: progress,
        onBackPressed: onBack,
      ),
      body: Column(
        children: [
          Expanded(
            child: pages[currentPage], // Display the current page widget
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: CustomButton(
            text: currentPage == pages.length - 1
                ? "Develop your plan" // Change text for last page
                : "Next",
            onPressed: onNext,
            disableButton: currentPage == pages.length - 1
                ? false
                : (isGenderSelected && isActivityLevelSelected), // Disable logic based on your selection logic
          ),
        ),
      ),
    );
  }
}
