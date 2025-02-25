import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nutri_app/controller/onbording_screen_controller.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import '../../../widgets/secoundery_costom_appbar.dart';
import '../widgets/meal_time_dialog.dart';

class MealTimingPage extends StatefulWidget {
  final bool isOnboarding;

  const MealTimingPage({super.key, required this.isOnboarding});

  @override
  State<MealTimingPage> createState() => _MealTimingPage();
}

class _MealTimingPage extends State<MealTimingPage> {
  final MultiStepPageController parentController = Get.find();

  // String breakfastTime = "00:00 AM";
  // String lunchTime = "00:00 AM";
  // String dinnerTime = "00:00 AM";
  // String snacksTime = "00:00 AM";
  // List<String> mealNames = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];

  void _showTimeDialogUpdate(String mealName, String initialTime) async {
    DateTime? selectedTime = await showDialog(
      context: context,
      builder: (context) {
        return MealTimeDialog(mealName: mealName, initialTime: initialTime);
      },
    );
    if (selectedTime != null) {
      parentController.onboardingData.update((val) {
        val?.mealTimings = val.mealTimings.map((element) {
          if (element.meal == mealName) {
            return element.copyWith(time: selectedTime);
          }
          return element;
        }).toList();
      });
    }
  }

  void _showAddMealDialog() {
    String newMealName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Color(0xffF3F6FF),
          title: Text('Enter New Meal'),
          content: TextField(
            onChanged: (value) {
              newMealName = value;
            },
            decoration: InputDecoration(hintText: 'Enter meal name'),
          ),
          actions: [
            CustomButton(
              text: "Done",
              onPressed: () {
                if (newMealName.isNotEmpty) {
                  parentController.onboardingData.update((val) {
                    val?.mealTimings.add(MealTiming(newMealName, null));
                  });
                  context.pop(); // dialog close
                }
              },
            ),
          ],
        );
      },
    );
  }

  String formatTime(DateTime? time) {
    return time != null ? DateFormat('hh:mm a').format(time) : '00:00 AM';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isOnboarding
          ? null // If it's onboarding, no appbar is shown
          : SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
          child: Obx(
            () => Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Enter your Meal timings',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.h,
              ),
              ...List.generate(
                  parentController.onboardingData.value.mealTimings.length,
                  (index) {
                MealTiming meal =
                    parentController.onboardingData.value.mealTimings[index];
                return InkWell(
                  onTap: () {
                    String initialTime = formatTime(parentController
                        .onboardingData.value.mealTimings[index].time);
                    _showTimeDialogUpdate(meal.meal, initialTime);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: .06.sh,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(meal.meal),
                          ),
                          subtitle: Text(formatTime(meal.time)),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Icon(Icons.access_time),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Divider(indent: 20, endIndent: 20),
                      ),
                    ],
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Image.asset(
                      "assets/images/plus.png",
                      width: 20.w,
                    ),
                    onPressed: _showAddMealDialog,
                  ),
                  Text(
                    "Add Meal",
                    style: TextStyle(
                        color: Color(0xff2E3038),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
//
// void updateMealTime(String meal, String time) {
//   parentController.onboardingData.update((val) {
//     val?.mealTimings = val.mealTimings.map((element) {
//       if (element.meal == meal) {
//         return element.copyWith(
//             time: time); // Create a new instance with updated time
//       }
//       return element; // Keep the original if it doesn't match
//     }).toList();
//   });
// }
}
