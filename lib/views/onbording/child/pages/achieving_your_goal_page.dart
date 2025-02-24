import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/onbording_screen_controller.dart';
import '../widgets/selection_widgets.dart';

class AchievingYourGoalPage extends StatelessWidget {
  const AchievingYourGoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the instance of AchievingYourGoalController
    final AchievingYourGoalController controller = Get.find();

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
            _buildSelectionItem(controller, 'Inconsistent routine', 'Inconsistent'),
            SizedBox(height: 15.h),
            _buildSelectionItem(controller, 'Poor dietary choices', 'Poor'),
            SizedBox(height: 15.h),
            _buildSelectionItem(controller, 'Limited support system', 'Limited'),
            SizedBox(height: 15.h),
            _buildSelectionItem(controller, 'Hectic lifestyle', 'Hectic'),
            SizedBox(height: 15.h),
            _buildSelectionItem(controller, 'Lack of meal ideas', 'Lack'),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  // Helper method to create a SelectionItem
  Widget _buildSelectionItem(AchievingYourGoalController controller, String text, String goal) {
    return Obx(() {
      return SelectionItem(
        text: text,
        iconPath: 'assets/svg/dot.svg',
        onTap: () => controller.selectGoal(goal),
        isSelected: controller.selectedGoal.value == goal,
      );
    });
  }
}
