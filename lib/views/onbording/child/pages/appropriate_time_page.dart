import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutri_app/themes/text_size.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';

class AppropriateTimePage extends StatefulWidget {
  const AppropriateTimePage({super.key});

  @override
  State<AppropriateTimePage> createState() => _AppropriateTimePage();
}

class _AppropriateTimePage extends State<AppropriateTimePage> {
final MultiStepPageController parentController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Cal Z Creates Your Desired Results in Appropriate Time',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
              textAlign: TextAlign.start,
            ),
            Spacer(
              flex: 2,
            ),
            Obx(() {
              if(parentController.onboardingData.value.chooseGoal == 'loss_weight')
                return Image.asset("assets/images/weight_loss.png");
              else if(parentController.onboardingData.value.chooseGoal == 'gain_weight')
                return Image.asset("assets/images/weight_gain.png");
              else if(parentController.onboardingData.value.chooseGoal == 'maintain_weight')
                return Image.asset("assets/images/weight_maintain.png");
              else
              return Image.asset("assets/images/just_exploring.png");
            }),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
