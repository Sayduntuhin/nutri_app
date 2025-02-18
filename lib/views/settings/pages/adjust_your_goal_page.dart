import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/secoundery_costom_appbar.dart';

class AdjustGoalPage extends StatefulWidget {
  const AdjustGoalPage({super.key});

  @override
  State<AdjustGoalPage> createState() => _AdjustGoalPageState();
}

class _AdjustGoalPageState extends State<AdjustGoalPage> {
  final TextEditingController _caloriesController =
      TextEditingController(text: '2200');
  final TextEditingController _carbohydrateController =
      TextEditingController(text: '360');
  final TextEditingController _proteinController =
      TextEditingController(text: '60');
  final TextEditingController _fatController =
      TextEditingController(text: '25');

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
            _buildSectionTitle("Adjust Your Goal Today"),
            SizedBox(height: 50.h),
            // Calories Section
            _buildInputSection(
              svgPath: 'assets/svg/cal_with_name.svg',
              label: 'Calories',
              controller: _caloriesController,
              unit: 'kcal',
            ),
            SizedBox(height: 20.h),

            // Carbohydrates Section
            _buildInputSection(
              svgPath: 'assets/svg/carb_with_name.svg',
              label: 'Carbohydrate',
              controller: _carbohydrateController,
              unit: 'g',
            ),
            SizedBox(height: 20.h),

            // Protein Section
            _buildInputSection(
              svgPath: 'assets/svg/protin_with_name.svg',
              label: 'Protein',
              controller: _proteinController,
              unit: 'g',
            ),
            SizedBox(height: 20.h),

            // Fat Section
            _buildInputSection(
              svgPath: 'assets/svg/fat_with_ name.svg',
              label: 'Fat',
              controller: _fatController,
              unit: 'g',
            ),
            Spacer(flex: 2,),
            Center(child: CustomButton(text: "Adjust and Save", onPressed: (){})),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }

  // Method to build input sections
  Widget _buildInputSection({
    required String svgPath,
    required String label,
    required TextEditingController controller,
    required String unit,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Icon and label
        Row(

          children: [
            SvgPicture.asset(svgPath),
            SizedBox(width: 10.w),
            Text(
              label,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 20.w,)

          ],
        ),
        Expanded(
            child: Divider(
              thickness: .4.h,
            )),
        Container(
          width: 100.w,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: '0',
              suffixText: unit,
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }
}
