import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Widget buildAppbar(BuildContext context,String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 55.h,
      child: Row(
        children: [
          InkWell(onTap: context.pop, child: Icon(Icons.arrow_back)),
          Spacer(),
          Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(width: 16.w),
          Spacer(),
        ],
      ),
    ),
  );
}
