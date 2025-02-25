import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  final String text;
  double? width = 350.w;
  double? height;
  final VoidCallback? onPressed;
  final bool disableButton;

   CustomButton({Key? key, required this.text, required this.onPressed, this.disableButton = false, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:  disableButton ? Color(0xffA0A0A0) : Color(0xff090F03),
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Color(0xffFEFEFE) ,
          ),
        ),
      ),
    );
  }
}


