import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../themes/colours.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});
  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  int _notificationCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meals Page",
          style: TextStyle(
              fontSize: 20.sp, color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/svg/notifications.svg',
                  width: 30.w,
                ),
                onPressed: () {},
              ),
              if (_notificationCount > 0)
                Positioned(
                  right: 2,
                  top: -5,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 15.w,
                      minHeight: 15.w,
                    ),
                    child: Center(
                      child: Text(
                        '$_notificationCount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRecentActivities(),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your meals",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        _buildActivityItem(
            "Breakfast", 1000, "View all", 'assets/svg/swimming.svg'),
        _buildActivityItem("Lunch", 1000, "View all", 'assets/svg/pizza.svg'),
        _buildActivityItem(
            "Dinner", 1200, "View all", 'assets/svg/running.svg'),
        _buildActivityItem("Snacks", 1000, "View all", 'assets/svg/pizza.svg'),
      ],
    );
  }

  Widget _buildActivityItem(
      String activity, int kcal, String time, String svgPath) {
    return Card(
      color: Color(0xffFCFCFC),
      elevation: 1,
      child: SizedBox(
        height: 60.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(svgPath),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  activity,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "$kcal kcal",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              time,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(
              width: 15.w,
            )
          ],
        ),
      ),
    );
  }
}
