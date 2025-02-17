import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0.44.sh,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcomepage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: 50.h,
                    left: 50.w,
                    right: 50.w,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(
                        'assets/images/bars.png',
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
              top: 0.44.sh,
              left: 0,
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(
                'assets/svg/background.svg',
                width: double.infinity,
                fit: BoxFit.fill,
                height: 350.h,
              )),
          Positioned(
            top: 0.55.sh,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome!!',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'Calorie Tracking Made Easy',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Just snap a quick photo of your meal \nand we’ll do the rest',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100.h),
                  CustomButton(
                      text: "Get Start Now",
                      onPressed: () {
                        context.push('/multisteppage');
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
