import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/themes/text_size.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';

class TargetPage extends StatefulWidget {
  final bool isOnboarding;

  const TargetPage({super.key, required this.isOnboarding});

  @override
  State<TargetPage> createState() => _TargetPage();
}

class _TargetPage extends State<TargetPage> {
  final MultiStepPageController pageController = Get.find();
  // double sliderValue = 0.0; // The slider's initial value (0.0 is the start)
  // String speedText = 'Slow'; // Default label for the speed

  // This function is used to change the speed text based on slider value
  void _updateSpeedLabel(double value) {
    pageController.onboardingData.update((val) {
      final speed = value >= 1
          ? 'Fast'
          : value == .5
              ? 'Normal'
              : 'Slow';
      val?.targetSpeed = val.targetSpeed.copyWith(value: value,speed: speed);
    });
    // setState(() {
    //   sliderValue = value;
    //   if (value >= 1) {
    //     speedText = 'Fast';
    //   } else if (value == .5) {
    //     speedText = 'Normal';
    //   } else {
    //     speedText = 'Slow';
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isOnboarding
          ? null // If it's onboarding, no appbar is shown
          : SecounderyCostomAppbar(onBackPressed: ()=> context.pop()),
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'How Fast You Want To Catch Your Target?',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Slow Icon and label
                  Column(
                    children: [
                      Text('Slow', style: TextStyle(fontSize: 14.sp)),
                      SvgPicture.asset(
                        'assets/svg/slow.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      'assets/svg/leftarrow.svg',
                    ),
                  ),
                  Column(
                    children: [
                      Text('Normal', style: TextStyle(fontSize: 14.sp)),
                      SvgPicture.asset(
                        'assets/svg/normal.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SvgPicture.asset(
                      'assets/svg/rightarrow.svg',
                    ),
                  ),
                  Column(
                    children: [
                      Text('Fast', style: TextStyle(fontSize: 14.sp)),
                      SvgPicture.asset(
                        'assets/svg/fast.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(() => SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 10,
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    value: pageController.onboardingData.value.targetSpeed.value,
                    min: 0.0,
                    max: 1.0,
                    activeColor: Color(0xff090F03),
                    inactiveColor: Color(0xffD1D6CC),
                    divisions: 2,
                    onChanged: (value) {
                      _updateSpeedLabel(
                          value); // Update speed label based on slider position
                    },
                  ),
                )),
            SizedBox(height: 20.h),
            Obx(()=>Text(
                pageController.onboardingData.value.targetSpeed.speed,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            if (!widget.isOnboarding)
              CustomButton(
                width: 340.w,
                text: "Update Target ",
                onPressed: () {},
              ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
