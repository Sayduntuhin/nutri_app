import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/home_page_secendery_Appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: buildAppBar(context, "Notifications","Back"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMealList(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        _buildMealItem(
          "Today, you consumed 500 kcal Extra.",
          1000,
          "View all",
          'assets/svg/minus.svg',
        ),
        _buildMealItem("Today, you consumed 500 kcal less.", 1000, "View all",
            'assets/svg/black_plus.svg'),
        _buildMealItem("Congratulations!!! Total calorie achieved today.", 1200,
            "View all", 'assets/svg/allok.svg'),
        _buildMealItem("Add your breakfast items", 1000, "View all",
            'assets/svg/dinner.svg'),
      ],
    );
  }

  Widget _buildMealItem(
      String mealType, int kcal, String view, String svgPath) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: Color(0xffFCFCFC),
        elevation: 0.5,
        child: SizedBox(
          height: 50.h,
          child: Row(
            children: [
              SizedBox(width: 10),
              SvgPicture.asset(svgPath, width: 24.w),
              SizedBox(width: 10.w),
              Text(
                mealType,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff313330)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
