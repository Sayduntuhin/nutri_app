import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/themes/text_size.dart';


class PhysicalActivityLevelPage extends StatefulWidget {
  const PhysicalActivityLevelPage({super.key});

  @override
  State<PhysicalActivityLevelPage> createState() =>
      _PhysicalActivityLevelPageState();
}

class _PhysicalActivityLevelPageState extends State<PhysicalActivityLevelPage> {
  String? selectedActivityLevel;
  void onActivityLevelSelect(String level) {
    setState(() {
      selectedActivityLevel = level;
    });
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
              'How Many Workouts Do You Do Per Weeks?',
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
              flex: 2,
            ),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Lite');
              },
              child: Container(
                width: 340.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: selectedActivityLevel == 'Lite'
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
                              color: selectedActivityLevel == 'Lite'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp)),
                      SizedBox(height: 5.h),
                      Text('Physical activity level (1.2 to1.3)',
                          style: TextStyle(
                              color: selectedActivityLevel == 'Lite'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Moderate');
              },
              child: Container(
                width: 340.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: selectedActivityLevel == 'Moderate'
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
                              color: selectedActivityLevel == 'Moderate'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp)),
                      SizedBox(height: 5.h),
                      Text('Physical activity level (1.2 to1.3)',
                          style: TextStyle(
                              color: selectedActivityLevel == 'Moderate'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Heavy');
              },
              child: Container(
                width: 340.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: selectedActivityLevel == 'Heavy'
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
                              color: selectedActivityLevel == 'Heavy'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp)),
                      SizedBox(height: 5.h),
                      Text('Physical activity level (1.2 to1.3)',
                          style: TextStyle(
                              color: selectedActivityLevel == 'Heavy'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            GestureDetector(
              onTap: () {
                onActivityLevelSelect('Rest');
              },
              child: Container(
                width: 340.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: selectedActivityLevel == 'Rest'
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
                              color: selectedActivityLevel == 'Rest'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16.sp)),
                      SizedBox(height: 5.h),
                      Text('Physical activity level (1.2 to1.3)',
                          style: TextStyle(
                              color: selectedActivityLevel == 'Rest'
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
