import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutri_app/themes/colours.dart';

class AddMealListPage extends StatefulWidget {
  final String? mealType; // Receives mealType from navigation

  const AddMealListPage({super.key, this.mealType});

  @override
  _AddMealListPageState createState() => _AddMealListPageState();
}

class _AddMealListPageState extends State<AddMealListPage> {
  String? selectedMeal = "";
  String selectedFilter = "Quick log"; // Default selected filter

  @override
  void initState() {
    super.initState();
    selectedMeal = widget.mealType; // ✅ Set initial meal type from navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: _buildAppBar(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 10.h),
            _buildFilterButtons(),
            SizedBox(height: 10.h),
            Expanded(child: _buildFoodList()),
          ],
        ),
      ),
    );
  }

  /// **🔻 App Bar with Dropdown**
  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 90.w,
      leading: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          Text("Back",style: TextStyle(color: textColor),)
        ],
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Row(
          children: [
            DropdownButton<String>(
              value: selectedMeal,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
              underline: Container(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: textColor,letterSpacing: 1.2),
              items: ["Breakfast", "Lunch", "Dinner", "Snacks"].map((String meal) {
                return DropdownMenuItem<String>(
                  value: meal,
                  child: Text(meal),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedMeal = newValue!;
                });
              },
            ),
          ],
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  /// **🔻 Search Bar**
  Widget _buildSearchBar() {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Icon(Icons.search, color: Color(0xff26272B), size: 20),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search name",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w,vertical: 14.h),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SvgPicture.asset('assets/svg/scan.svg', width: 20.w, height: 20.h,colorFilter: const ColorFilter.mode(Color(0xff6B7280), BlendMode.srcIn)),
          ),
        ],
      ),
    );
  }

  /// **🔻 Filter Buttons (Quick Log, Recent, Created)**
  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _filterButton("Quick log","assets/svg/quick_log.svg" ,isActive: selectedFilter == "Quick log"),
        _filterButton("Recent", 'assets/svg/recent.svg', isActive: selectedFilter == "Recent"),
        _filterButton("Created",'assets/svg/create.svg' ,isActive: selectedFilter == "Created"),
      ],
    );
  }

  Widget _filterButton(String text,String svgPath, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 5.w),
            SvgPicture.asset(svgPath,colorFilter: ColorFilter.mode(isActive ? Color(0xffFDFDFE) : textColor, BlendMode.srcIn)),
          ],
        ),
      ),
    );
  }

  /// **🔻 Food List Based on Selected Filter**
  Widget _buildFoodList() {
    List<Map<String, String>> foodItems = _getFoodItems(selectedFilter);

    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return _buildFoodItem(foodItems[index]["name"]!, foodItems[index]["kcal"]!);
      },
    );
  }
  Widget _buildFoodItem(String name, String kcal) {
    return GestureDetector(
      onTap: () {
        _showServingDialog(context, name);
      },
      child: Card(
        color: Color(0xffFCFCFC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        child: ListTile(
          leading: Container(
            height: 35.w,
            width: 35.w,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(Icons.add, color: Colors.black, size: 18),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            kcal,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ),
      ),
    );
  }

  void _showServingDialog(BuildContext context, String foodName) {
    TextEditingController servingController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          title: Text(
            "Enter serving or portion",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: servingController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Ex. 1, 2, 3 etc.",
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                ),
              ),
              SizedBox(height: 15.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // ✅ Close input dialog
                  _showSuccessPopup(context, foodName); // ✅ Show success popup
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // ✅ Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showSuccessPopup(BuildContext context, String foodName) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from closing manually
      builder: (context) {
        Timer(Duration(seconds: 2), () {
          if (context.mounted && Navigator.canPop(context)) {
            Navigator.pop(context, true); // ✅ Closes only the success popup
          }
        });
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.black, size: 40.w),
              SizedBox(height: 10.h),
              Text(
                "$foodName added successfully",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
    );

    // ✅ Use Timer to close the dialog after 2 seconds

  }




  /// **🔻 Sample Food Items for Different Filters**
  List<Map<String, String>> _getFoodItems(String filter) {
    if (filter == "Quick log") {
      return [
        {"name": "Pizza", "kcal": "310 kcal"},
        {"name": "Burger", "kcal": "310 kcal"},
        {"name": "Strawberry", "kcal": "310 kcal"},
        {"name": "Pizza", "kcal": "310 kcal"},
        {"name": "Burger", "kcal": "310 kcal"},
        {"name": "Strawberry", "kcal": "310 kcal"},
      ];
    } else if (filter == "Recent") {
      return [
        {"name": "Vanilla Ice Cream", "kcal": "300 kcal"},
        {"name": "Hot Dog", "kcal": "280 kcal"},
        {"name": "Vegetables", "kcal": "120 kcal"},
      ];
    } else {
      return [
        {"name": "Pasta", "kcal": "350 kcal"},
        {"name": "Rice & Beans", "kcal": "400 kcal"},
        {"name": "Salad", "kcal": "200 kcal"},
      ];
    }
  }
}
