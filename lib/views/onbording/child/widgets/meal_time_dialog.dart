import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealTimeDialog extends StatefulWidget {
  final String mealName;
  final String? initialTime;
  final Function(String time) onTimeSelected;

  const MealTimeDialog({
    Key? key,
    required this.mealName,
    required this.initialTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  _MealTimeDialogState createState() => _MealTimeDialogState();
}

class _MealTimeDialogState extends State<MealTimeDialog> {
  late String selectedTime;
  late String hour;
  late String minute;
  late String meridian;

  late TextEditingController hourController;
  late TextEditingController minuteController;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.initialTime ?? "00:00 AM";
    hour = selectedTime.split(":")[0];
    minute = selectedTime.split(":")[1].split(" ")[0];
    meridian = selectedTime.split(" ")[1];

    // Initialize the controllers
    hourController = TextEditingController(text: hour);
    minuteController = TextEditingController(text: minute);
  }

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  void _updateTime() {
    widget.onTimeSelected("$hour:$minute $meridian");
    Navigator.pop(context); // Close the dialog after time is updated
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      backgroundColor: Color(0xffF3F6FF),
      title: Text("Enter Time"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9.sp,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Meal Time",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xff696969)),
                ),
                Spacer(flex: 2),
                Text(
                  "Hour",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xff696969)),
                ),
                SizedBox(width: 40),
                Text(
                  "Min",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xff696969)),
                ),
                SizedBox(width: 20),
                Text(
                  "Meridiem \nindicators",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xff696969)),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text("${widget.mealName}:", style: TextStyle(fontSize: 16.sp)),
                Spacer(flex: 2),
                SizedBox(
                  width: 0.1.sw,
                  height: 0.04.sh,
                  child: TextField(
                    controller: hourController,
                    decoration: InputDecoration(
                      hintText: "00",
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        hour = value;
                      });
                    },
                    onSubmitted: (_) {
                      _updateTime(); // Update time when the user presses "Done"
                    },
                  ),
                ),
                SizedBox(width: 10),
                Image.asset("assets/images/colon.png", height: 20.w),
                SizedBox(width: 10),
                SizedBox(
                  width: 0.1.sw,
                  height: 0.04.sh,
                  child: TextField(
                    controller: minuteController,
                    decoration: InputDecoration(
                      hintText: "00",
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: BorderSide(),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        minute = value;
                      });
                    },
                    onSubmitted: (_) {
                      _updateTime(); // Update time when the user presses "Done"
                    },
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          meridian = 'AM';
                        });
                      },
                      child: SizedBox(
                        width: 35.w,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              meridian == 'AM'
                                  ? 'assets/svg/timeSelected.svg' // Path to selected AM icon
                                  : 'assets/svg/timeUnselected.svg', // Path to unselected AM icon
                              width: 10,
                              height: 10,
                            ),
                            SizedBox(width: 2.w),
                            Text("AM")
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          meridian = 'PM';
                        });
                      },
                      child: SizedBox(
                        width: 35.w,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              meridian == 'PM'
                                  ? 'assets/svg/timeSelected.svg' // Path to selected PM icon
                                  : 'assets/svg/timeUnselected.svg', // Path to unselected PM icon
                              width: 10,
                              height: 10,
                            ),
                            SizedBox(width: 2.w),
                            Text("PM")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15),
              ],
            ),
          ],
        ),
      ),
      actions: [],
    );
  }
}
