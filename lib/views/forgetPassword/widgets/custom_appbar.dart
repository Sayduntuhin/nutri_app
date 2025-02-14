import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Widget buildAppbar(BuildContext context,String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 55.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              color: Colors.black12,
            ),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          InkWell(onTap: context.pop, child: Icon(Icons.arrow_back)),
          SizedBox(width: 80.w),
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    ),
  );
}
