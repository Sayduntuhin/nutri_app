import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/height_meter.dart';
import '../widgets/unitselectionButton_widgets.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({super.key});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  double height = 185;
  String selectedUnit = "Centimeter";



  void onUnitSelect(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  String get heightDisplay {
    if (selectedUnit == "Feet") {
      double feet = height / 30.48;
      return "${feet.toStringAsFixed(2)} ft";
    } else if (selectedUnit == "Inch") {
      double inches = height / 2.54;
      return "${inches.toStringAsFixed(2)} in";
    } else {
      return "$height cm";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'How Tall Are You?',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'This will be utilized to adjust your tailored plan.',
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 45.h,
              width: 325.w,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE0E0E0), width: 1.0),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UnitSelectionButton(
                    unitText: "Centimeter",
                    selectedUnit: selectedUnit,
                    onUnitSelect: onUnitSelect,
                    width: 150.w,
                  ),

                  UnitSelectionButton(
                    unitText: "Feet",
                    selectedUnit: selectedUnit,
                    onUnitSelect: onUnitSelect,
                    width: 150.w
                    ,
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  width: 150,
                  child: VerticalScrollPicker(
                    foregroundItemColor: Color(0xff090F03),
                    backgroundItemColor: Colors.black.withValues(alpha: 0.1),
                    bottomValue: 0, // Minimum value at bottom
                    topValue: 200, // Maximum value at top
                    interval: 10,
                    onChanged: (value) {
                      print("-------------------$value");
                    },// Step size
                  ),
                ),
                 Spacer(flex: 1),
                // Text(
                //   heightDisplay,
                //   style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                // ),
                Image.asset("assets/images/male2.png", height: 0.4.sh,)

              ],
            ),

            Spacer(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}



