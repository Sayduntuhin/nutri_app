import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/themes/text_size.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import '../../../../controller/onbording_screen_controller.dart';

class AskPage extends StatefulWidget {
  const AskPage({super.key});

  @override
  State<AskPage> createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  final MultiStepPageController parentController = Get.find();

  void onAnsSelect(String answer) {
    parentController.onboardingData.update((val) {
      val?.askPage = answer;
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
              'Have you Tried any other calorie tracking app?',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: () {
                onAnsSelect('yes');
              },
              child: Obx(() => Container(
                    width: 340.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color:
                          parentController.onboardingData.value.askPage == 'yes'
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.thumb_up_alt,
                            color:
                                parentController.onboardingData.value.askPage ==
                                        'yes'
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        Text('Yes',
                            style: TextStyle(
                                color: parentController
                                            .onboardingData.value.askPage ==
                                        'yes'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16.sp)),
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onAnsSelect('no');
              },
              child: Obx(() => Container(
                    width: 340.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color:
                          parentController.onboardingData.value.askPage == 'no'
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.thumb_down_alt,
                            color:
                                parentController.onboardingData.value.askPage ==
                                        'no'
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                        Text(
                          'No',
                          style: TextStyle(
                              color: parentController
                                          .onboardingData.value.askPage ==
                                      'no'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp),
                        ),
                      ],
                    ),
                  )),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
