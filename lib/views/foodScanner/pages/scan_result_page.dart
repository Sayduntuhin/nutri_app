import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/themes/colours.dart';

import '../../home/widgets/home_page_secendery_Appbar.dart';

class ScanResultPage extends StatelessWidget {
  final String imagePath;
  const ScanResultPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: buildAppBar(context, "Result","Back"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFoodCard(context),
              SizedBox(height: 20.h),
              _buildNutrientSection("Macronutrients", [
                _buildNutrientRow("Carbs", "1000 kcl",' (100g)'),
                _buildNutrientRow("Protein", "N/A",''),
                _buildNutrientRow("Fats", "400Cal",'(100g)'),
              ]),
              SizedBox(height: 50.h,
                child: Divider(color: Color(0xffE4E4E5),),
              ),
              _buildNutrientSection("Micronutrients", [
                _buildMicronutrientstitle('Vitamins'),
                _buildNutrientRow("Vit- A","", "(12mg)"),
                _buildNutrientRow("Vit- B","" ,"(1mg)"),
                _buildNutrientRow("Vit- C", '',"(12mg)"),
                SizedBox(height: 50.h,
                  child: Divider(color: Color(0xffE4E4E5),),
                ),
                _buildMicronutrientstitle('Minerals'),
                _buildNutrientRow("Potassium (K)","", "(12mg)"),
                _buildNutrientRow("Sodium (Na)","" ,"(1mg)"),
                _buildNutrientRow("Calcium (Ca)", '',"(12mg)"),
                SizedBox(height: 50.h,
                  child: Divider(color: Color(0xffE4E4E5),),
                ),
                _buildMicronutrientstitle('Other Essential  Nutrients'),
                _buildNutrientRow("Antioxidants","", "(12mg)"),
                _buildNutrientRow("Phytonutrients","" ,"(1mg)"),
                _buildNutrientRow("Probiotics & Prebiotics", '',"(12mg)"),
                _buildNutrientRow("Enzymes & Coenzymes", '',"(12mg)"),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  /// **🔻 Food Card with Image**
  Widget _buildFoodCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: imagePath.isNotEmpty
                  ? Image.file(
                File(imagePath), // ✅ Show captured image
                width: 90.w,
                height: 80.w,
                fit: BoxFit.cover,
              )
                  : Image.asset(
                "assets/images/placeholder.png", // ✅ Placeholder image if no image found
                width: 80.w,
                height: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150.w,
                  child: Text(
                    "Chapati, souce and vegetables",
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500,color: textColor),
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "750 Cal",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            PopupMenuButton<int>(
              icon: Icon(Icons.more_horiz_rounded, color: Color(0xffACADB0)),
              color: Color(0xffF7F9FF),
              offset: Offset(0, 20),
              onSelected: (value) {
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  onTap: (){
                    context.push("/addtolog");
                    /*Navigator.push(context, MaterialPageRoute(builder: (context) => AddMealListPage()));*/
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/checkmark.svg',width: 13,),
                      SizedBox(width: 10.w),
                      Text("Add to log",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff575757)),),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: (){
                    context.push("/addmeal");
                    /*Navigator.push(context, MaterialPageRoute(builder: (context) => AddMealListPage()));*/
                  },
                  value: 2,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/add.svg',width: 15,colorFilter: ColorFilter.mode(Color(0xff575757), BlendMode.srcIn)),
                      SizedBox(width: 10.w),
                      Text("Add to meal",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff575757)),),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  onTap: context.pop,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/scan.svg',width: 16,height: 16,colorFilter: ColorFilter.mode(Color(0xff575757), BlendMode.srcIn)),
                      SizedBox(width: 10.w),
                      Text("Re-scan",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff575757)),),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 4,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/delete.svg',width: 16,height: 16,colorFilter: ColorFilter.mode(Color(0xff575757), BlendMode.srcIn)),
                      SizedBox(width: 10.w),
                      Text("Delete",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff575757)),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// **🔻 Section Header + List of Nutrients**
  Widget _buildNutrientSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          child: Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5.h),
        Column(children: children),
      ],
    );
  }
  /// **🔻 Single Row for Nutrients**
  Widget _buildNutrientRow(String name, String value,String weight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xff6F7071))),
          Expanded(child: Divider(color: Color(0xffEFEFEF),)),
          if (value.isNotEmpty)
            Text(
              value,
                style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400,color: Color(0xff6F7071))
            ),   Text(
              weight,
                style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff6F7071))
            ),
        ],
      ),
    );
  }
  Widget _buildMicronutrientstitle(String title,) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Text(title,textAlign: TextAlign.start, style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color(0xff626263))),
        ],
      ),
    );
  }
}
