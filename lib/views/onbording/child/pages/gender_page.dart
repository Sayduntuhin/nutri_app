import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/themes/text_size.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({super.key});

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {

  String? selectedGender;

  void onGenderSelect(String gender) {
    setState(() {
      selectedGender = gender;
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
            Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: () {
                onGenderSelect('Male');
              },
              child: Container(
                width: 340.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: selectedGender == 'Male' ? Colors.black : Colors.white,
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
                            color: selectedGender == 'Male'
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16.sp))),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onGenderSelect('Female');
              },
              child: Container(
                width: 340.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color:
                      selectedGender == 'Female' ? Colors.black : Colors.white,
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
                        color: selectedGender == 'Female'
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16.sp),
                  ),
                ),
              ),
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
