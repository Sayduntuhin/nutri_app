import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  String breakfastTime = "00:00 AM";
  String lunchTime = "00:00 AM";
  String dinnerTime = "00:00 AM";
  String snacksTime = "00:00 AM";
  List<String> mealNames = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];

  void _showTimeDialog(String mealName, String initialTime, Function(String time) onTimeSelected) {
    showDialog(
      context: context,
      builder: (context) {
        return MealTimeDialog(
          mealName: mealName,
          initialTime: initialTime,
          onTimeSelected: onTimeSelected,
        );
      },
    );
  }

  void _showAddMealDialog() {
    String newMealName = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: Color(0xffF3F6FF),
          title: Text('Enter New Meal'),
          content: TextField(
            onChanged: (value) {
              newMealName = value;
            },
            decoration: InputDecoration(hintText: 'Enter meal name'),
          ),
          actions: [
            CustomButton(text: "Done", onPressed:  () {
          if (newMealName.isNotEmpty) {
            setState(() {
              mealNames.add(newMealName);
            });
            Navigator.pop(context);
          }
        },),
          ],
        );
      },
    );
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Enter your Meal timings',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h,),
              for (String meal in mealNames)
                InkWell(
                  onTap: () {
                    String initialTime = '00:00 AM'; // Set default time for each meal
                    if (meal == 'Breakfast') initialTime = breakfastTime;
                    if (meal == 'Lunch') initialTime = lunchTime;
                    if (meal == 'Dinner') initialTime = dinnerTime;
                    if (meal == 'Snacks') initialTime = snacksTime;
        
                    _showTimeDialog(meal, initialTime, (time) {
                      setState(() {
                        if (meal == 'Breakfast') {
                          breakfastTime = time;
                        } else if (meal == 'Lunch') {
                          lunchTime = time;
                        } else if (meal == 'Dinner') {
                          dinnerTime = time;
                        } else if (meal == 'Snacks') {
                          snacksTime = time;
                        }
                      });
                    });
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: .06.sh,
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(meal),
                          ),
                          subtitle: Text(meal == 'Breakfast'
                              ? breakfastTime
                              : meal == 'Lunch'
                              ? lunchTime
                              : meal == 'Dinner'
                              ? dinnerTime
                              : snacksTime),
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
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Image.asset("assets/images/plus.png",width: 20.w,),
                    onPressed: _showAddMealDialog,
                  ),
                  Text("Add Meal",style: TextStyle(color: Color(0xff2E3038),fontSize: 16.sp,fontWeight: FontWeight.w400),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
