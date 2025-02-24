import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nutri_app/themes/text_size.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';

import '../../../../controller/onbording_screen_controller.dart';

class CountrySelectionPage extends StatefulWidget {
  const CountrySelectionPage({super.key});

  @override
  State<CountrySelectionPage> createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  final MultiStepPageController parentController = Get.find();

  void onCountrySelect(Country country) {
    // setState(() {
    //   // When a country is selected, update both the country name and flag in the controller
    //   countryController.selectCountry(country.name, country.flagEmoji);
    // });
    parentController.onboardingData.update((data) {
      data?.country = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Select Your Country Name',
              style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 1),
            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: false,
                  onSelect: onCountrySelect,
                );
              },
              child: Obx(
                () => Container(
                  width: 340.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:
                        parentController.onboardingData.value.country ==
                                null
                            ? Colors.white
                            : Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Obx(() {
                      // Show the selected country and flag when available
                      return Text(
                        parentController
                                    .onboardingData.value.country?.name !=
                                null
                            ? '${parentController.onboardingData.value.country?.flagEmoji ?? ""} ${parentController.onboardingData.value.country?.name}'
                            : "Tap to select country",
                        style: TextStyle(
                          color: parentController
                                      .onboardingData.value.country ==
                                  null
                              ? Colors.black
                              : Colors.white,
                          fontSize: 16.sp,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
