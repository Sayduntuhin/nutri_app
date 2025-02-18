import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../themes/colours.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final ValueNotifier<DateTime> _focusedDay;
  int _notificationCount = 3;

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _focusedDay = ValueNotifier(DateTime.now());
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    _focusedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Image.asset(
          'assets/images/logo.png',
        ),
        title: SvgPicture.asset(
          'assets/svg/calz.svg',
          width: 60.w,
        ),
        centerTitle: true,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/svg/notifications.svg',
                  width: 30.w,
                ),
                onPressed: () {
                },
              ),
              if (_notificationCount > 0)
                Positioned(
                  right: 2,
                  top: -5,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 15.w,
                      minHeight: 15.w,
                    ),
                    child: Center(
                      child: Text(
                        '$_notificationCount',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCalendar(),
              SizedBox(height: 30.h),
              Container(
                height: 125.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      ),
                    ]),
                child: Row(
                  children: [
                    SizedBox(width: 30.w),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: '2300 ',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: '\nCalories left',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          TextSpan(
                            text: '\n(Intake)',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    _buildBurnedCaloriesCircle(
                        100.w, 100.h, "assets/svg/cal.svg", 8.w,50.w),
                    Spacer(
                      flex: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Burned',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: Color(0xff7A7B7C)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            'assets/svg/plus_icons.svg',
                            width: 20.w,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '1100 ',
                            style: TextStyle(
                              color: Color(0xff515151),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '\nkcal',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffACADB0),
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30.w),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              _buildInfoCards(),
              SizedBox(height: 30.h),
              _buildRecentActivities(),
              SizedBox(height: 100.h,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay.value,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay.value, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay.value = selectedDay;
          _focusedDay.value = focusedDay;
        });
      },

      calendarFormat: CalendarFormat.week,
      availableGestures:
          AvailableGestures.horizontalSwipe,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: false,
        rightChevronVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        weekendStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(color: Colors.black),
        outsideTextStyle: TextStyle(color: Colors.grey),
        selectedTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildInfoCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoCard("75g", "Carbs left", 'assets/svg/carbs.svg'),
        _buildInfoCard("50g", "Protein left", 'assets/svg/protin.svg'),
        _buildInfoCard("25g", "Fat left", 'assets/svg/fat.svg'),
      ],
    );
  }

  Widget _buildBurnedCaloriesCircle(
      double width, double height, String Svgpath, double circleWidth,double imageWidth) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xffEDEDED), width: circleWidth),
      ),
      child: Center(
        child: SvgPicture.asset(
          Svgpath,
          width:imageWidth ,
        ),
      ),
    );
  }

  Widget _buildInfoCard(String value, String label, String Svgpath) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 1,
      child: Container(
        height: 150.h,
        width: .27.sw,
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: value,
                style: TextStyle(
                  color: Color(0xff515151),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n$label',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff111C06),
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: _buildBurnedCaloriesCircle(
                  70.w, 70.h, Svgpath, 5.w,28.w),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Recent Activities",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 2,),
            Text(
              "Activities",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400,color: Color(0xff9D9D9D)),
            ),
            SizedBox(width: 10,),
            GestureDetector(
                onTap: (){context.push('/dailyactivitypage');},
                child: SvgPicture.asset('assets/svg/plus_icons.svg',width: 24,))
          ],
        ),
        SizedBox(height: 20.h),
        _buildActivityItem("Swimming", 1000, "30 mins", 'assets/svg/swimming.svg'),
        _buildActivityItem("Pizza", 1000, "40 mins",'assets/svg/pizza.svg'),
        _buildActivityItem("Running", 1200, "20 mins",'assets/svg/running.svg'),
        _buildActivityItem("Pizza", 1000, "60 mins",'assets/svg/pizza.svg'),
      ],
    );
  }

  Widget _buildActivityItem(String activity, int kcal, String time,String svgPath) {
    return Card(
      color: Color(0xffFCFCFC),
      elevation: 1,
      child: SizedBox(
        height: 60.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10,),
            SvgPicture.asset(svgPath),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  activity,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(
                      "$kcal kcal",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(width: 10.w),

                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              time,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(width: 15.w,)
          ],
        ),
      ),
    );
  }
}
