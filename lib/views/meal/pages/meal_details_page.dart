import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/colours.dart';

class MealDetailsPage extends StatefulWidget {
  final String mealType;
  final int kaloriesAmount;
  final String svgPath;

  const MealDetailsPage({super.key, required this.mealType, required this.kaloriesAmount,required this.svgPath});

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  Set<String> selectedItems = {}; // ✅ Stores selected food items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: .3.sw,
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Text("Back",style: TextStyle(color: textColor),)
          ],
        ),
        title: Text(widget.mealType, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meal items",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Total:',
                      style: TextStyle(
                        color: Color(0xff5D5F5C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      children:  <TextSpan>[
                        TextSpan(
                          text: '${widget.kaloriesAmount} kcal',
                          style: TextStyle(
                              color: Color(0xff888987),
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              _buildAddItemCard(), // ✅ Keep "Add Items" button
              _buildMealItems(),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }

  /// **🔻 "Add Items" Card (Navigation to AddMealListPage)**
  Widget _buildAddItemCard() {
    return Card(
      color: Color(0xffFCFCFC),
      elevation: 0.5,
      child: SizedBox(
        height: 60.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            SvgPicture.asset(widget.svgPath, width: 30.w),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.mealType}",
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "${widget.kaloriesAmount} kcal",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              "Add items",
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(width: 5.w),
            IconButton(
              onPressed: () {
                context.push("/addmeallist", extra: {"mealType": widget.mealType});
              },
              icon: SvgPicture.asset('assets/svg/plus_icons.svg', width: 20),
            ),
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }

  /// **🔻 List of Food Items**
  Widget _buildMealItems() {
    List<Map<String, dynamic>> meals = _getMealItems(widget.mealType);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var meal in meals)
          _buildMealItem(meal["name"], meal["kcal"], meal["svg"]),
      ],
    );
  }

  /// **🔻 Food Item with Selectable State**
  Widget _buildMealItem(String mealName, int kcal, String svgPath) {
    bool isSelected = selectedItems.contains(mealName);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedItems.remove(mealName); // ✅ Unselect item
          } else {
            selectedItems.add(mealName); // ✅ Select item
          }
        });
      },
      child: Card(
        color: isSelected ? Colors.green.withOpacity(0.2) : Color(0xffFCFCFC), // ✅ Change background color if selected
        elevation: 1,
        child: SizedBox(
          height: 60.h,
          child: Row(
            children: [
              SizedBox(width: 10),
              SvgPicture.asset(svgPath, width: 30.w),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(mealName, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  SizedBox(height: 5.h),
                  Text("$kcal kcal", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                ],
              ),
              Spacer(),
              if (isSelected) // ✅ Show checkmark if selected
                Icon(Icons.check_circle, color: Colors.green, size: 18),
              SizedBox(width: 15.w),
            ],
          ),
        ),
      ),
    );
  }

  /// **🔻 Sample Meal Data**
  List<Map<String, dynamic>> _getMealItems(String mealType) {
    switch (mealType) {
      case "Breakfast":
        return [
          {"name": "Omelette", "kcal": 200, "svg": "assets/svg/pizza.svg"},
          {"name": "Toast", "kcal": 150, "svg": "assets/svg/pizza.svg"},
          {"name": "Smoothie", "kcal": 250, "svg": "assets/svg/pizza.svg"},
        ];
      case "Lunch":
        return [
          {"name": "Grilled Chicken", "kcal": 600, "svg": "assets/svg/pizza.svg"},
          {"name": "Salad", "kcal": 300, "svg": "assets/svg/pizza.svg"},
          {"name": "Pasta", "kcal": 500, "svg": "assets/svg/pizza.svg"},
        ];
      case "Dinner":
        return [
          {"name": "Steak", "kcal": 700, "svg": "assets/svg/pizza.svg"},
          {"name": "Rice & Beans", "kcal": 550, "svg": "assets/svg/pizza.svg"},
        ];
      case "Snacks":
        return [
          {"name": "Protein Bar", "kcal": 200, "svg": "assets/svg/pizza.svg"},
          {"name": "Fruit", "kcal": 100, "svg": "assets/svg/pizza.svg"},
        ];
      default:
        return [];
    }
  }
}


