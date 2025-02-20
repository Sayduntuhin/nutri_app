import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/secoundery_costom_appbar.dart';
import '../widgets/height_meter.dart';
import '../widgets/unitselectionButton_widgets.dart';

class HeightPage extends StatefulWidget {
  final bool isOnboarding; // Added parameter to check if it's Onboarding or Edit page

  const HeightPage({super.key, required this.isOnboarding}); // Pass the parameter

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
    if (selectedUnit == "Pounds") {
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
      appBar: widget.isOnboarding
          ? null // If it's onboarding, no appbar is shown
          : SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop), // If it's the edit page, show the appbar
      body: SafeArea(
        child: Padding(
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
              SizedBox(height: 15.h),
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
                      width: 150.w,
                    ),
                  ],
                ),
              ),
              Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.5.sh,
                    width: 150,
                    child: VerticalScrollPicker(
                      foregroundItemColor: Color(0xff090F03),
                      backgroundItemColor: Colors.black12,
                      bottomValue: 0, // Minimum value at bottom
                      topValue: 200, // Maximum value at top
                      interval: 10,
                      onChanged: (value) {
                        print("-------------------$value");
                      }, // Step size
                    ),
                  ),
                  Spacer(flex: 1),
                  Image.asset(
                    "assets/images/male2.png",
                    height: 0.5.sh,
                  ),
                ],
              ),
              Spacer(),
              // Conditional button display
              if (!widget.isOnboarding)
                CustomButton(
                  width: 340.w,
                  text: "Update Height ",
                  onPressed: () {},
                ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
