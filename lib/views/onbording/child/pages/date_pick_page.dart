import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../../../themes/text_size.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';

class DatePickerPage extends StatefulWidget {
  final bool isOnboarding;

  const DatePickerPage({super.key,required this.isOnboarding});

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime _selectedDate = DateTime.now();

  // Function to handle the selected date
  void _onDateChanged(DateTime dateTime) {
    setState(() {
      _selectedDate = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.isOnboarding
            ? null // If it's onboarding, no appbar is shown
            : SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop),
        body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Column(
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
            Spacer(flex: 2,),
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: ScrollDatePicker(
                selectedDate: _selectedDate,
                locale: Locale('en'),
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
            ),
            Spacer(flex: 2,),
            if (!widget.isOnboarding)
              CustomButton(
                width: 340.w,
                text: "Update Date of Birth",
                onPressed: () {},
              ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
    )
    );
  }
}
