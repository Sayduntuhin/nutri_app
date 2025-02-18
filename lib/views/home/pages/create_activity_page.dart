import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nutri_app/themes/colours.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({super.key});

  @override
  State<CreateActivityPage> createState() => _CreateActivityPageState();
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  String? selectedIcon; // Store selected icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: _buildAppBar(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildIconButton(),
            SizedBox(height: 30.h),
            _buildInputField("Activity name", "Ex. Baseball"),
            SizedBox(height: 15.h),
            _buildInputField("Duration", "Ex. 30min"),
            SizedBox(height: 15.h),
            _buildCalorieField(),
            Spacer(flex: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CustomButton(width: 340,text: "Add to activity", onPressed: (){}),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  /// **🔻 Custom AppBar**
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
      title: Text(
        "Create",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: textColor,letterSpacing: 1.5),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  /// **🔻 Centered "Set Icon" Button**
  Widget _buildIconButton() {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => _showIconPicker(context),

            child: Container(
            
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: Color(0xffFDFDFE),
                border: Border.all(color: Color(0xffD9D9D9), width: 1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/plus_icons.svg",
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Set Icon",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff6B7280), fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  /// **🔻 Show Bottom Sheet for Icon Selection**
  void _showIconPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSearchBar(),
              SizedBox(height: 10.h),
              _buildIconGrid(),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
  /// **🔻 Search Bar in Bottom Sheet**
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
                contentPadding: EdgeInsets.symmetric(vertical: 14.h),
              ),
            ),
          ),
        ],
      ),
    );
  }
  /// **🔻 Input Fields (Activity Name, Duration)**
  Widget _buildInputField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,color: Color(0xff3D3D3D)),
        ),
        SizedBox(height: 5.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.white
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
            ),
          ),
        ),
      ],
    );
  }

  /// **🔻 "Calorie Burned" Field with Auto Fill Button**
  Widget _buildCalorieField() {
    return Row(
      children: [
        Expanded(
          child: _buildInputField("Calorie burned", "Ex. 250kcal"),
        ),
        SizedBox(width: 10.w),
        Padding(
          padding: const EdgeInsets.only(top: 26),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff090F03),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            ),
            child: Row(
              children: [
               SvgPicture.asset('assets/svg/autofill.svg'),
                SizedBox(width: 5.w),
                Text(
                  "Auto fill",
                  style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// **🔻 Grid of Icons**
  Widget _buildIconGrid() {
    List<String> iconList = [
      'assets/svg/icon1.svg',
      'assets/svg/icon2.svg',
      'assets/svg/icon3.svg',
      'assets/svg/icon4.svg',
      'assets/svg/icon5.svg',
      'assets/svg/icon6.svg',
      'assets/svg/icon7.svg',
      'assets/svg/icon8.svg',
      'assets/svg/icon9.svg',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: iconList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIcon = iconList[index];
            });
            Navigator.pop(context); // ✅ Close Bottom Sheet after selection
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: SvgPicture.asset(iconList[index], width: 30.w, height: 30.w),
            ),
          ),
        );
      },
    );
  }

  /// **🔻 "Add to Activity" Button**
  Widget _buildAddButton() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            "Add to activity",
            style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
