import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
          "Meals Items",
          style: TextStyle(
            fontSize: 20.sp,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
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
        SizedBox(height: 0.05.sh),
        Text(
          "Your Meals",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20.h),
        _buildMealItem(
            "Breakfast", 1000, "View all", 'assets/svg/breakfast.svg',),
        _buildMealItem("Lunch", 1000, "View all", 'assets/svg/lunch.svg'),
        _buildMealItem(
            "Dinner", 1200, "View all", 'assets/svg/lunch.svg'),
        _buildMealItem("Snacks", 1000, "View all", 'assets/svg/dinner.svg'),
      ],
    );
  }

  Widget _buildMealItem(String mealType, int kcal, String view, String svgPath) {
    return InkWell(
      onTap: () {
        context.push("/meal-details", extra: {
          "mealType": mealType, // ✅ Pass mealType
          "kcal": kcal,
          "svgpath" : svgPath// ✅ Pass kcal amount
        });
      },
      child: Card(
        color: Color(0xffFCFCFC),
        elevation: 1,
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              SizedBox(width: 10),
              SvgPicture.asset(svgPath, width: 30.w),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mealType,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "$kcal kcal",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  )
                ],
              ),
              Spacer(),
              Text(
                view,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(width: 15.w),
            ],
          ),
        ),
      ),
    );
  }
}
