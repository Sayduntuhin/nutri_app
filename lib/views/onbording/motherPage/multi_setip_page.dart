import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/onbording/child/pages/ask_page.dart';
import 'package:nutri_app/views/onbording/child/pages/height_page.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../child/pages/contry_select_page.dart';
import '../child/pages/gender_page.dart';
import '../child/pages/physical_activity_level_page.dart';
import '../child/pages/weight_page.dart';

class MultiStepPage extends StatefulWidget {
  const MultiStepPage({super.key});

  @override
  _MultiStepPageState createState() => _MultiStepPageState();
}

class _MultiStepPageState extends State<MultiStepPage> {
  int currentPage = 0; // Track the current page index
  double progress = 0.07; // Start the progress
  String? selectedGender;
  String? selectedActivityLevel;
  bool isGenderSelected = false; // Track if gender is selected
  bool isActivityLevelSelected = false; // Track if activity level is selected

  final List<Widget> pages = [
    GenderSelectionPage(),
    PhysicalActivityLevelPage(),
    CountrySelectionPage(),
    AskPage(),
    HeightPage(),
    WeightPage()
  ];
  void onNext() {
    if (currentPage < pages.length - 1) {
      setState(() {
        currentPage++;
        progress = (currentPage + 1) * 0.07; // Update progress incrementally
      });
    } else {
      print("Flow complete");
    }
  }
  void onBack() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        progress = (currentPage + 1) * 0.07; // Update progress when going back
      });
    }
    else if(currentPage == 0) {
      Navigator.pop(context);
    }
  }
  // This function will be called to enable/disable the Next button on gender selection


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        progress: progress,
        onBackPressed: onBack,

      ),
      body: Column(
        children: [
          Expanded(
            child: pages[currentPage], // Display the current page widget
          ),
          CustomButton(text: "Next", onPressed: onNext ,    disableButton: false, ),// Disable if no selection),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}

