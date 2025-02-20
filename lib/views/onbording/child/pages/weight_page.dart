import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';
import '../widgets/unitselectionButton_widgets.dart';
// Assuming you have this widget

class WeightPage extends StatefulWidget {
  final bool isOnboarding;
  const WeightPage({super.key, required this.isOnboarding});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double weight = 0.0;
  String selectedUnit = "Kilogram";
  final TextEditingController weightController = TextEditingController();

  void onUnitSelect(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  String get weightDisplay {
    if (selectedUnit == "Pounds") {
      return "${(weight * 2.20462).toStringAsFixed(2)} lbs"; // Convert kg to pounds
    } else {
      return "$weight kg";
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Enter your weight',
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
                      unitText: "Kilogram",
                      selectedUnit: selectedUnit,
                      onUnitSelect: onUnitSelect,
                      width: 0.38.sw,
                    ),
                    UnitSelectionButton(
                      unitText: "Pounds",
                      selectedUnit: selectedUnit,
                      onUnitSelect: onUnitSelect,
                      width: 0.38.sw,
                    ),
                  ],
                ),
              ),
              // Spacer(flex: 1),
              SizedBox(
                height: 0.020.sh,
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 180,
                    startAngle: -180,
                    endAngle: 0,
                    showLastLabel: true,
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value:
                            weight, // Needle will move based on the weight value
                        needleColor: Colors.black,
                        knobStyle: KnobStyle(color: Colors.black),
                        needleEndWidth: 8,
                        needleStartWidth: 0,
                        animationDuration: 500,
                        animationType: AnimationType.easeInCirc,
                      ),
                    ],
                    ranges: [
                      GaugeRange(
                          startValue: 0,
                          endValue: 180,
                          color: Color(0xff111C06),
                          startWidth: 0,
                          endWidth: 0),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          weightDisplay,
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.3,
                      ),
                    ],
                    axisLineStyle: AxisLineStyle(
                      thickness: 0,
                      color: Colors.grey.shade300,
                    ),
                    labelOffset: 20,
                    axisLabelStyle: GaugeTextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.bold),
                    labelsPosition: ElementsPosition.outside,
                    interval: 20,
                  ),
                ],
              ),
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
                    borderRadius:
                        BorderRadius.circular(10.r), // Rounded corners
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10.w), // Left padding for label
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
                                fontSize: 14
                                    .sp), // Lighter text color for placeholder
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
                            setState(() {
                              weight = double.tryParse(value) ??
                                  weight; // Update weight when entered
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (!widget.isOnboarding)
                Column(
                  children: [
                    SizedBox(
                      height: 0.2.sh,
                    ),
                    CustomButton(
                      width: 340.w,
                      text: "Update Weight",
                      onPressed: () {},
                    ),
                  ],
                ),
              SizedBox(
                height: 0.1.sh,
              ),
              // Spacer(flex: 3,),
            ],
          ),
        ),
      ),
    );
  }
}
