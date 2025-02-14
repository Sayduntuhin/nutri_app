import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/themes/text_size.dart';

class AppropriateTimePage extends StatefulWidget {
  const AppropriateTimePage({super.key});

  @override
  State<AppropriateTimePage> createState() => _AppropriateTimePage();
}

class _AppropriateTimePage extends State<AppropriateTimePage> {
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
            Image.asset("assets/images/weight_maintain.png"),
            Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}
