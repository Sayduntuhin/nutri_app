import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import '../../../../controller/onbording_screen_controller.dart';
import '../../../../themes/text_size.dart';

class PhysicalActivityLevelPage extends StatefulWidget {
  const PhysicalActivityLevelPage({super.key});

  @override
  State<PhysicalActivityLevelPage> createState() =>
      _PhysicalActivityLevelPageState();
}

class _PhysicalActivityLevelPageState extends State<PhysicalActivityLevelPage> {
  // final ActivityLevelSelectionController activityLevelController = Get.put(ActivityLevelSelectionController());
  final MultiStepPageController parentController = Get.find();

  void onActivityLevelSelect(String level) {
    parentController.onboardingData.update((data) => data?.activityLevel = level);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'How Many Workouts Do You Do Per Week?',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
            Text(
              'It will be used to calibrate your custom plan.',
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2),
            // Wrapping each GestureDetector in an Obx to listen for state changes
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Lite');
              },
              child: Obx(() {
                return Container(
                  width: 340.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: parentController.onboardingData.value.activityLevel == 'Lite'
                        ? Colors.black
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lite',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Lite'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp)),
                        SizedBox(height: 5.h),
                        Text('Physical activity level (1.2 to 1.3)',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Lite'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Moderate');
              },
              child: Obx(() {
                return Container(
                  width: 340.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: parentController.onboardingData.value.activityLevel == 'Moderate'
                        ? Colors.black
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Moderate',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Moderate'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp)),
                        SizedBox(height: 5.h),
                        Text('Physical activity level (1.4 to 1.5)',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Moderate'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Heavy');
              },
              child: Obx(() {
                return Container(
                  width: 340.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: parentController.onboardingData.value.activityLevel == 'Heavy'
                        ? Colors.black
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Heavy',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Heavy'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp)),
                        SizedBox(height: 5.h),
                        Text('Physical activity level (1.6 to 1.7)',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Heavy'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Rest');
              },
              child: Obx(() {
                return Container(
                  width: 340.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: parentController.onboardingData.value.activityLevel == 'Rest'
                        ? Colors.black
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rest and Recovery',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Rest'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp)),
                        SizedBox(height: 5.h),
                        Text('Physical activity level (1.2)',
                            style: TextStyle(
                                color: parentController.onboardingData.value.activityLevel == 'Rest'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 40.h),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
