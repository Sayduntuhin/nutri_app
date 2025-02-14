import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/themes/text_size.dart';

import '../widgets/selection_widgets.dart';

class AchievingYourGoalPage extends StatefulWidget {
  const AchievingYourGoalPage({super.key});

  @override
  State<AchievingYourGoalPage> createState() => _AchievingYourGoalPage();
}

class _AchievingYourGoalPage extends State<AchievingYourGoalPage> {
  String? selectedGoal;

  void onGoalSelect(String goal) {
    setState(() {
      selectedGoal = goal;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            SelectionItem(
              text: 'Inconsistent routine',
              iconPath: 'assets/svg/dot.svg',
              onTap: () => onGoalSelect('Inconsistent'),
              isSelected: selectedGoal == 'Inconsistent',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Poor dietary choices',
              iconPath: 'assets/svg/dot.svg',
              onTap: () => onGoalSelect('Poor'),
              isSelected: selectedGoal == 'Poor',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Limited support system',
              iconPath: 'assets/svg/dot.svg',
              onTap: () => onGoalSelect('Limited'),
              isSelected: selectedGoal == 'Limited',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Hectic lifestyle',
              iconPath: 'assets/svg/dot.svg',
              onTap: () => onGoalSelect('Hectic'),
              isSelected: selectedGoal == 'Hectic',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Lack of meal ideas',
              iconPath: 'assets/svg/dot.svg',
              onTap: () => onGoalSelect('Lack'),
              isSelected: selectedGoal == 'Lack',
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
