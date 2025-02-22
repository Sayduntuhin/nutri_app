import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSelectedClander(BuildContext context, String title, String selectedDate) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          selectedDate,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
        ),
        SizedBox(width: 10.w),
        InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/svg/calander.svg'))
      ],
    ),
  );
}


class CalendarSelector extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onCalendarTap; // Callback to show the calendar

  const CalendarSelector({
    Key? key,
    required this.title,
    required this.date,
    required this.onCalendarTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            date,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: onCalendarTap, // Call the passed callback
            child: SvgPicture.asset('assets/svg/calander.svg'),
          ),
        ],
      ),
    );
  }
}
