import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/selection_widgets.dart';

class ChooseGoalPage extends StatefulWidget {
  const ChooseGoalPage({super.key});

  @override
  State<ChooseGoalPage> createState() => _ChooseGoalPage1State();
}

class _ChooseGoalPage1State extends State<ChooseGoalPage> {
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
              'Choose your Goal?',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 3),
            SelectionItem(
              text: 'Gain Weight',
              iconPath: 'assets/svg/gain_weight.svg',
              onTap: () => onGoalSelect('gain'),
              isSelected: selectedGoal == 'gain',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Loss Weight',
              iconPath: 'assets/svg/loss_weight.svg',
              onTap: () => onGoalSelect('loss'),
              isSelected: selectedGoal == 'loss',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Maintain Weight',
              iconPath: 'assets/svg/mantain_weight.svg',
              onTap: () => onGoalSelect('maintain'),
              isSelected: selectedGoal == 'maintain',
            ),
            SizedBox(height: 15.h),
            SelectionItem(
              text: 'Just Exploring',
              iconPath: 'assets/svg/exploering.svg',
              onTap: () => onGoalSelect('exploring'),
              isSelected: selectedGoal == 'exploring',
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
