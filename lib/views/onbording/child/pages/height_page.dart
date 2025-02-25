import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/secoundery_costom_appbar.dart';
import '../../../../controller/onbording_screen_controller.dart';
import '../widgets/height_meter.dart';
import '../widgets/unitselectionButton_widgets.dart';

class HeightPage extends StatefulWidget {
  final bool isOnboarding;

  const HeightPage({super.key, required this.isOnboarding});

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  String selectedUnit = "Centimeter";
  final HeightPageController heightController = Get.put(HeightPageController());

  final MultiStepPageController parentController = Get.find();

  void onUnitSelect(String unit) {
    setState(() {
      selectedUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isOnboarding
          ? null // If onboarding, no appbar
          : SecounderyCostomAppbar(
              onBackPressed: Navigator.of(context).pop), // If edit, show appbar
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
                    height: 0.48.sh,
                    width: 0.5.sw,
                    child: VerticalScrollPicker(
                      foregroundItemColor: Color(0xff090F03),
                      backgroundItemColor: Colors.black12,
                      bottomValue: 0,
                      // Minimum value at bottom
                      topValue: 200,
                      // Maximum value at top
                      interval: 10,
                      Unit: _unite(selectedUnit),
                      onChanged: (value) {
                        // When the user scrolls, mark the height as changed
                        heightController.setHeightChanged(true);
                      },
                    ),
                  ),
                  Spacer(flex: 1),
                  // Gender-based image display
                  Image.asset(
                    parentController.onboardingData.value.gender == 'Female'
                        ? 'assets/images/female.png'
                        : 'assets/images/male.png',
                    height: 0.35.sh,
                  ),
                ],
              ),
              Spacer(),
              // Conditional button display
              if (!widget.isOnboarding)
                CustomButton(
                  width: 340.w,
                  text: "Update Height",
                  onPressed: () {},
                ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String _unite(String tab) {
    return tab == "Centimeter"
        ? "cm"
        : tab == "Feet"
            ? "ft"
            : "in";
  }
}
