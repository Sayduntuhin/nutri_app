import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';

import '../widgets/selection_widgets.dart';

class DietTypePage extends StatefulWidget {
  const DietTypePage({super.key});

  @override
  State<DietTypePage> createState() => _DietTypePage();
}

class _DietTypePage extends State<DietTypePage> {

  final MultiStepPageController parentController = Get.find();

  void onGoalSelect(String diet) {
    parentController.onboardingData.update((val) {
      val?.dietType = diet;
    });
    // setState(() {
    //   selectedDietType = diet;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Obx(
          () {
            String? selectedDietType = parentController.onboardingData.value.dietType;
            return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'What is the type of your diet?',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 3),
              SelectionItem(
                text: 'Balanced',
                iconPath: 'assets/svg/balance.svg',
                onTap: () => onGoalSelect('Balanced'),
                isSelected: selectedDietType == 'Balanced',
              ),
              SizedBox(height: 15.h),
              SelectionItem(
                text: 'Pescatarian',
                iconPath: 'assets/svg/pescatarian.svg',
                onTap: () => onGoalSelect('Pescatarian'),
                isSelected: selectedDietType == 'Pescatarian',
              ),
              SizedBox(height: 15.h),
              SelectionItem(
                text: 'Vegetarian',
                iconPath: 'assets/svg/vegetarian.svg',
                onTap: () => onGoalSelect('Vegetarian'),
                isSelected: selectedDietType == 'Vegetarian',
              ),
              SizedBox(height: 15.h),
              SelectionItem(
                text: 'Vegan',
                iconPath: 'assets/svg/vegan.svg',
                onTap: () => onGoalSelect('Vegan'),
                isSelected: selectedDietType == 'Vegan',
              ),
              SizedBox(height: 15.h),
              SelectionItem(
                text: 'Flexible eating',
                iconPath: 'assets/svg/f_eating.svg',
                onTap: () => onGoalSelect('Flexible eating'),
                isSelected: selectedDietType == 'Flexible eating',
              ),
              Spacer(flex: 3),
            ],
          );
          },
        ),
      ),
    );
  }
}
