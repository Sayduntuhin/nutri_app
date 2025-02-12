import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart';
import 'package:nutri_app/themes/text_size.dart';

class CountrySelectionPage extends StatefulWidget {
  const CountrySelectionPage({super.key});

  @override
  State<CountrySelectionPage> createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  String? selectedCountry;
  String? selectedFlag;

  void onCountrySelect(Country country) {
    setState(() {
      selectedCountry = country.name;
      selectedFlag = country.flagEmoji;
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
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: false,
                  onSelect: onCountrySelect,
                );
              },
              child: Container(
                width: 340.w,
                height: 45.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: selectedCountry == null ? Colors.white : Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    selectedCountry != null
                        ? '${selectedFlag ?? ""} $selectedCountry '
                        : "Tap to select country",
                    style: TextStyle(
                        color: selectedCountry == null
                            ? Colors.black
                            : Colors.white,
                        fontSize: 16.sp),
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
