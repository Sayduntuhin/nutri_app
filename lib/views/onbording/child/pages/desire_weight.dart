import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';
import '../widgets/unitselectionButton_widgets.dart';
// Assuming you have this widget

class DesireWeightPage extends StatefulWidget {
  final bool isOnboarding;

  const DesireWeightPage({super.key, required this.isOnboarding});

  @override
  State<DesireWeightPage> createState() => _DesireWeightPageState();
}

class _DesireWeightPageState extends State<DesireWeightPage> {
  // double weight = 0.0;
  // String selectedUnit = "Kilogram";
  final TextEditingController weightController = TextEditingController();

  final MultiStepPageController parentController = Get.find();

  void onUnitSelect(String unit) {
    parentController.onboardingData.update((val) {
      val?.desiredWeight = val.desiredWeight.copyWith(selectedUnit: unit);
    });
  }

  void onWeightChange(double weight) {
    parentController.onboardingData.update((val) {
      val?.desiredWeight = val.desiredWeight.copyWith(weight: weight);
    });
  }


  // String get weightDisplay {
  //   if (selectedUnit == "Pounds") {
  //     return "${(weight * 2.20462).toStringAsFixed(2)} lbs"; // Convert kg to pounds
  //   } else {
  //     return "$weight kg";
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: widget.isOnboarding
          ? null // If it's onboarding, no appbar is shown
          : SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop),
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Enter your Desired weight',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              height: 45.h,
              width: 325.w,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE0E0E0), width: 1.0),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UnitSelectionButton(
                        unitText: "Kilogram",
                        selectedUnit: parentController.onboardingData.value.desiredWeight.selectedUnit,
                        onUnitSelect: onUnitSelect,
                        width: 0.38.sw,
                      ),
                      UnitSelectionButton(
                        unitText: "Pounds",
                        selectedUnit: parentController.onboardingData.value.desiredWeight.selectedUnit,
                        onUnitSelect: onUnitSelect,
                        width: 0.38.sw,
                      ),
                    ],
                  )),
            ),
            Spacer(
              flex: 1,
            ),
            Obx(() {
              double weight =
                  parentController.onboardingData.value.desiredWeight.weight ??
                      0.0;
              return SfLinearGauge(
                minimum: 0,
                maximum: 200,
                maximumLabels: 2,
                markerPointers: [
                  LinearShapePointer(
                    value: weight,
                    shapeType: LinearShapePointerType.invertedTriangle,
                    color: Colors.red,
                    onChanged: onWeightChange,
                  ),
                ],
                barPointers: [
                  LinearBarPointer(
                    thickness: 15,
                    edgeStyle: LinearEdgeStyle.bothCurve,
                    value: weight,
                    color: Colors.black,
                  ),
                ],
                axisTrackStyle: LinearAxisTrackStyle(
                  thickness: 15,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                ),
              );
            }),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 0.2.sw, right: 0.25.sw),
              child: Container(
                height: 35.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 1.0,
                      color: Colors.grey.shade300, // Lighter shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.r), // Rounded corners
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w), // Left padding for label
                      child: Text(
                        "Weight: ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90.w,
                      height: 35.h,
                      child: TextField(
                        controller: weightController,
                        decoration: InputDecoration(
                          hintText: "Enter here",
                          hintStyle: TextStyle(
                              color: Color(0xffC8C8C8),
                              fontSize:
                                  14.sp), // Lighter text color for placeholder
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                10.r), // Rounded corners for text field
                            borderSide:
                                BorderSide.none, // Remove default border
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          onWeightChange(double.tryParse(value) ?? 0.0);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            if (!widget.isOnboarding)
              CustomButton(
                width: 340.w,
                text: "Update Gender",
                onPressed: () {},
              ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
