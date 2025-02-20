import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_appbar_secoundery.dart';

class AddToMealPage extends StatefulWidget {
  const AddToMealPage({super.key});

  @override
  State<AddToMealPage> createState() => _AddToMealPageState();
}

class _AddToMealPageState extends State<AddToMealPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarSecoundery(title: "Meal Items",),
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
          "Breakfast", 1000, "Add here", 'assets/svg/breakfast.svg',),
        _buildMealItem("Lunch", 1000, "Add here", 'assets/svg/lunch.svg'),
        _buildMealItem(
            "Dinner", 1200, "Add here", 'assets/svg/lunch.svg'),
        _buildMealItem("Snacks", 1000, "Add here", 'assets/svg/dinner.svg'),
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
