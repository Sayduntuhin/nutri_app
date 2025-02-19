import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSelectedClander(BuildContext context, String title, String selectedDate) {


  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          selectedDate,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
        SizedBox(width: 10.w),
        InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/svg/calander.svg'))
      ],
    ),
  );
}