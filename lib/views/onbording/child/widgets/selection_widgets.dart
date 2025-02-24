import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectionItem extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;

  const SelectionItem({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 340.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isSelected ? Colors.black : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 15.w),
            SvgPicture.asset(
              iconPath,
              colorFilter: isSelected
                  ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            SizedBox(width: 10.w),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
