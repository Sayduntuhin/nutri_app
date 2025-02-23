import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:get/get.dart';

import '../../../../themes/text_size.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';
import '../../../../controller/onbording_screen_controller.dart';

class DatePickerPage extends StatefulWidget {
  final bool isOnboarding;

  const DatePickerPage({super.key, required this.isOnboarding});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  final DatePickerController datePickerController = Get.put(DatePickerController());

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
              child: ScrollDatePicker(
                selectedDate: datePickerController.selectedDate.value,
                locale: Locale('en'),
                onDateTimeChanged: (DateTime value) {
                  // Update the date in the controller and mark as selected
                  datePickerController.selectedDate.value = value;
                  datePickerController.isDateSelected.value = true;
                },

              ),
            ),
            Spacer(flex: 2),
            if (!widget.isOnboarding)
              Obx(() {
                return Visibility(
                  visible: datePickerController.isDateSelected.value,
                  child: CustomButton(
                    width: 340.w,
                    text: "Update Date of Birth",
                    onPressed: () {
                      // Handle the button press (e.g., update the date)
                      print("Date of Birth Updated: ${datePickerController.selectedDate.value}");
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
