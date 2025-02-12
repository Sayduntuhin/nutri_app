import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool disableButton;

  const CustomButton({Key? key, required this.text, required this.onPressed, this.disableButton = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:  disableButton ? Colors.grey : Colors.black,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 30.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


