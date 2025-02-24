import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:get/get.dart';
import '../../../../controller/onbording_screen_controller.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';
import '../widgets/unitselectionButton_widgets.dart';

class WeightPage extends StatefulWidget {
  final bool isOnboarding;

  const WeightPage({super.key, required this.isOnboarding});

  @override
  State<WeightPage> createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  final MultiStepPageController parentController = Get.find();
  final TextEditingController weightControllerInput = TextEditingController();

  void onUnitSelect(String unit) {
    parentController.onboardingData.update((val) {
      val?.weight = val.weight?.copyWith(selectedUnit: unit);
    });
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
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UnitSelectionButton(
                        unitText: "Kilogram",
                        selectedUnit: parentController
                                .onboardingData.value.weight.selectedUnit
                                .toString() ??
                            "0.00",
                        onUnitSelect: onUnitSelect,
                        width: 0.38.sw,
                      ),
                      UnitSelectionButton(
                        unitText: "Pounds",
                        selectedUnit: parentController
                                .onboardingData.value.weight.selectedUnit ??
                            "kg",
                        onUnitSelect: onUnitSelect,
                        width: 0.38.sw,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.020.sh),
              Obx(
                () => SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 180,
                      startAngle: -180,
                      endAngle: 0,
                      showLastLabel: true,
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: parentController
                                  .onboardingData.value.weight.weight ??
                              0,
                          // Bind the value here
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
                            "${parentController.onboardingData.value.weight?.weight} ${parentController.onboardingData.value.weight?.selectedUnit}",
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
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
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
                          controller: weightControllerInput,
                          decoration: InputDecoration(
                            hintText: "Enter here",
                            hintStyle: TextStyle(
                                color: Color(0xffC8C8C8), fontSize: 14.sp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10.w),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setWeight(value);
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
                    SizedBox(height: 0.2.sh),
                    CustomButton(
                      width: 340.w,
                      text: "Update Weight",
                      onPressed: () {},
                    ),
                  ],
                ),
              SizedBox(height: 0.1.sh),
            ],
          ),
        ),
      ),
    );
  }

  void setWeight(String value) {
    parentController.onboardingData.update((val) {
      val?.weight = val.weight?.copyWith(weight: double.parse(value));
    });
  }
}
