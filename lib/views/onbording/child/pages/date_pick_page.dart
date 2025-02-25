import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:get/get.dart';

import '../../../../themes/text_size.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';

class DatePickerPage extends StatefulWidget {
  final bool isOnboarding;

  const DatePickerPage({super.key, required this.isOnboarding});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  final MultiStepPageController parentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isOnboarding
          ? null // If it's onboarding, no appbar is shown
          : SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'When you were born?',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
            Text(
              'This will be utilized to adjust your tailored plan?',
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2),
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Obx(() {
                return ScrollDatePicker(
                  selectedDate:
                      parentController.onboardingData.value.birthdate ??
                          DateTime.now(),
                  locale: Locale('en'),
                  onDateTimeChanged: (DateTime value) {
                    parentController.onboardingData.update((val) {
                      val?.birthdate = value;
                    });
                  },
                );
              }),
            ),
            Spacer(flex: 2),
            if (!widget.isOnboarding)
              Obx(() {
                return Visibility(
                  visible:
                      parentController.onboardingData.value.birthdate != null,
                  child: CustomButton(
                    width: 340.w,
                    text: "Update Date of Birth",
                    onPressed: () {
                      // Handle the button press (e.g., update the date)
                      debugPrint(
                          "Date of Birth Updated: ${parentController.onboardingData.value.birthdate}");
                    },
                  ),
                );
              }),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
