import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import '../widgets/selection_widgets.dart';

class ChooseGoalPage extends StatefulWidget {
  const ChooseGoalPage({super.key});

  @override
  State<ChooseGoalPage> createState() => _ChooseGoalPage1State();
}

class _ChooseGoalPage1State extends State<ChooseGoalPage> {
  final MultiStepPageController parentController = Get.find();

  void onGoalSelect(String goal) {
    parentController.onboardingData.update((val) {
      val?.chooseGoal = goal;
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
            Obx(() {
              return SelectionItem(
                text: 'Gain Weight',
                iconPath: 'assets/svg/gain_weight.svg',
                onTap: () => onGoalSelect('gain_weight'),
                isSelected:
                    parentController.onboardingData.value.chooseGoal == 'gain_weight',
              );
            }),
            SizedBox(height: 15.h),
            Obx(() => SelectionItem(
                  text: 'Loss Weight',
                  iconPath: 'assets/svg/loss_weight.svg',
                  onTap: () => onGoalSelect('loss_weight'),
                  isSelected:
                      parentController.onboardingData.value.chooseGoal ==
                          'loss_weight',
                )),
            SizedBox(height: 15.h),
            Obx(
              () => SelectionItem(
                text: 'Maintain Weight',
                iconPath: 'assets/svg/mantain_weight.svg',
                onTap: () => onGoalSelect('maintain_weight'),
                isSelected: parentController.onboardingData.value.chooseGoal ==
                    'maintain_weight',
              ),
            ),
            SizedBox(height: 15.h),
            Obx(
              () => SelectionItem(
                text: 'Just Exploring',
                iconPath: 'assets/svg/exploering.svg',
                onTap: () => onGoalSelect('just_exploring'),
                isSelected: parentController.onboardingData.value.chooseGoal ==
                    'just_exploring',
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
