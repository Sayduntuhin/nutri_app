import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import '../../../../controller/onbording_screen_controller.dart';
import '../../../../themes/text_size.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';
class GenderSelectionPage extends StatefulWidget {
  final bool isOnboarding;

  const GenderSelectionPage({super.key, required this.isOnboarding});

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  final MultiStepPageController controller = Get.find();

  void onGenderSelect(String gender) {
    controller.onboardingData.update((data) => data?.gender = gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isOnboarding
          ? null // If it's onboarding, no appbar is shown
          : SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop),
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Choose Your Gender',
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
            Spacer(flex: 3),
            // Using Obx to listen to changes in selectedGender
            GestureDetector(
              onTap: () {
                onGenderSelect('Male');
              },
              child: Obx(() => Container(
                width: 340.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: controller.onboardingData.value.gender == 'Male' ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                    child: Text('Male',
                        style: TextStyle(
                            color: controller.onboardingData.value.gender == 'Male'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16.sp))),
              ) ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onGenderSelect('Female');
              },
              child: Obx(() => Container(
                width: 340.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: controller.onboardingData.value.gender == 'Female' ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Female',
                    style: TextStyle(
                        color: controller.onboardingData.value.gender == 'Female'
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16.sp),
                  ),
                ),
              )),
            ),
            Spacer(flex: 3),
            if (!widget.isOnboarding)
              CustomButton(
                width: 340.w,
                text: "Update Gender",
                onPressed: () {},
              ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
