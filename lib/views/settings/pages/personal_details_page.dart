import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/widgets/secoundery_costom_appbar.dart';
import 'package:path/path.dart';

class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecounderyCostomAppbar(
        onBackPressed: Navigator.of(context).pop,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Personal Details"),
            SizedBox(height: 20.h),
            _buildWeightGoalSection(context),
            SizedBox(height: 20.h),
            _buildListTileForAge("Age", 25),
            _buildListTile(
              "Height",
              context,
              () {
                context.push('/heightpage');
              },
            ),
            _buildListTile(
              "Current weight",
              context,
              () {
                context.push('/weightpage');
              },
            ),
            _buildListTile(
              "Gender",
              context,
              () {
                context.push('/genderpage');
              },
            ),
            _buildListTile(
              "Date of birth",
              context,
              () {
                context.push('/dateofbirthpage');
              },
            ),
            _buildListTile(
              "Change your motion to target",
              context,
              () {
                context.push('/targetpage');
              },
            ),
            _buildListTile(
              "Change password",
              context,
              () {
                context.push('/changepassword');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Weight Gain Goal Section
  Widget _buildWeightGoalSection(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: SizedBox(
        height: 0.1.sh,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Weight gain goal",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "5 kg",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  context.push('/weightgoalpage');
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/edit.svg'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Edit",
                      style: TextStyle(
                          color: Color(0xff111C06),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }
}

/// Build list tile with custom onTap function
Widget _buildListTile(String title, BuildContext context, VoidCallback onTap) {
  return SizedBox(
    height: 0.06.sh,
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
      onTap: onTap, // Use the passed custom onTap function
    ),
  );
}

// ListTile widget for each detail item
Widget _buildListTileForAge(String title, int age) {
  return SizedBox(
    height: 0.06.sh,
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp),
      ),
      trailing: Text(
        "${age}y",
        style: TextStyle(fontSize: 16.sp),
      ),
    ),
  );
}
