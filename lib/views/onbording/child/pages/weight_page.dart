import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../widgets/unitselectionButton_widgets.dart';
// Assuming you have this widget

class WeightPage extends StatefulWidget {
  const WeightPage({super.key});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  double weight = 85; // Default weight in kg
  String selectedUnit = "Kilogram"; // Default unit is kilogram
  final TextEditingController weightController = TextEditingController();

  // Handle unit selection
  void onUnitSelect(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  // Convert weight to pounds for the display.
  String get weightDisplay {
    if (selectedUnit == "Pounds") {
      return "${(weight * 2.20462).toStringAsFixed(2)} lbs"; // Convert kg to pounds
    } else {
      return "$weight kg"; // Default to kg
    }
  }

  @override
  void dispose() {
    super.dispose();
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
            Spacer(flex: 1),
            SizedBox(height: 20.h),

            // Display the Speedometer (Radial Gauge)
            Container(
              height: 200.h, // Adjust the height of the gauge
              width: 200.w, // Adjust the width of the gauge
              child: SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 180, // Set max value for the scale (180 degree scale)
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: weight, // Needle will move based on the weight value
                        needleColor: Colors.black,
                        knobStyle: KnobStyle(color: Colors.black),
                      ),
                    ],
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 180,
                        color: Colors.grey.shade300,
                        startWidth: 10,
                        endWidth: 10,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Text(
                          weight.toStringAsFixed(0),
                          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.2,
                      ),
                    ],
                    axisLineStyle: AxisLineStyle(
                      thickness: 12,
                      color: Colors.grey.shade300,
                    ),
                    labelOffset: 10,
                   // labelStyle: GaugeTextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // Weight TextField
            SizedBox(
              width: 150.w,
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                  hintText: "Enter weight",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    weight = double.tryParse(value) ?? weight; // Update weight when entered
                  });
                },
              ),
            ),
            SizedBox(height: 50.h),

            // Display the selected weight
            Text(
              weightDisplay,
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),

            Spacer(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
