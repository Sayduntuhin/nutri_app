import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutri_app/views/widgets/secoundery_costom_appbar.dart';

class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecounderyCostomAppbar( onBackPressed: Navigator.of(context).pop,),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Personal Details"),
            SizedBox(height: 20.h),
            _buildWeightGoalSection(),
            SizedBox(height: 20.h),
            _buildListTile("Age"),
            _buildListTile("Height"),
            _buildListTile("Current weight"),
            _buildListTile("Gender"),
            _buildListTile("Date of birth"),
            _buildListTile("Change your motion to target"),
            _buildListTile("Change password"),
          ],
        ),
      ),
    );
  }

  // Weight Gain Goal Section
  Widget _buildWeightGoalSection() {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: SizedBox(
        height: 75.h,
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
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "5 kg",
                    style: TextStyle(fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                   SvgPicture.asset('assets/svg/edit.svg'),
                    SizedBox(width: 5.w,),
                    Text("Edit",style: TextStyle(color: Color(0xff111C06),fontWeight: FontWeight.w500,fontSize: 12 .sp),)
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

  // ListTile widget for each detail item
  Widget _buildListTile(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
      onTap: () {
        // Handle tap, e.g., navigate to another page or show a dialog
      },
    );
  }

