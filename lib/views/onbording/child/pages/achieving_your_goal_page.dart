import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import '../../../../controller/onbording_screen_controller.dart';
import '../widgets/selection_widgets.dart';

class AchievingYourGoalPage extends StatefulWidget {
  const AchievingYourGoalPage({super.key});

  @override
  State<AchievingYourGoalPage> createState() => _AchievingYourGoalPageState();
}

class _AchievingYourGoalPageState extends State<AchievingYourGoalPage> {
  final MultiStepPageController parentController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Get the instance of AchievingYourGoalController

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'What’s Holding You Back From Achieving Your Goal?',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 3),
            // Each goal selection should update the controller's state
            _buildSelectionItem('Inconsistent routine', 'Inconsistent'),
            SizedBox(height: 15.h),
            _buildSelectionItem('Poor dietary choices', 'Poor'),
            SizedBox(height: 15.h),
            _buildSelectionItem('Limited support system', 'Limited'),
            SizedBox(height: 15.h),
            _buildSelectionItem('Hectic lifestyle', 'Hectic'),
            SizedBox(height: 15.h),
            _buildSelectionItem('Lack of meal ideas', 'Lack'),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  void updateGoal(String goal) {
    parentController.onboardingData.update((val) {
      val?.achieveGoal = goal;
    });
  }

  // Helper method to create a SelectionItem
  Widget _buildSelectionItem(String text, String goal) {
    return Obx(() {
      return SelectionItem(
        text: text,
        iconPath: 'assets/svg/dot.svg',
        onTap: () => updateGoal(goal),
        isSelected: parentController.onboardingData.value.achieveGoal == goal,
      );
    });
  }
}
