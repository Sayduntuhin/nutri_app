import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../themes/colours.dart';

Widget buildAppBar(BuildContext context, String title, String subtitle) {
  return AppBar(
    leadingWidth: .3.sw,
    leading: Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        Text(subtitle,style: TextStyle(color: textColor),)
      ],
    ),
    title: Text(
     title,
      style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
          letterSpacing: 1.2),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}