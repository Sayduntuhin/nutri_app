import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_app/themes/text_size.dart';

class ThanksPage extends StatefulWidget {
  const ThanksPage({super.key});

  @override
  State<ThanksPage> createState() => _ThanksPage();
}

class _ThanksPage extends State<ThanksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svg/allok.svg"),
                SizedBox(width: 10.w),
                Text("All Set",style: TextStyle(fontSize: 14.sp,color: Color(0xff111C06)),)
              ],
            ),
            SizedBox(height: 10,),
            Text(
              'Thank you for your confidence in us.',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80.h,),
            Text(
              "Your privacy and security are \nour top priorities",
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff111C06),
                letterSpacing: 1.2
              ),  textAlign: TextAlign.center,

            ),
            Spacer(flex: 2,),

          ],
        ),
      ),
    );
  }
}
