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
  final int _notificationCount = 4;

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.07.sh),
        child: _buildAppBar(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.01.sh,),
            buildCalendar(),
            SizedBox(height: .01.sh),
            Container(
              height: 0.13.sh,
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
            SizedBox(height: .01.sh),
            _buildInfoCards(),
            SizedBox(height: 0.02.sh),
            _buildRecentActivitieswhenempty(),
           /* _buildRecentActivities(),
            SizedBox(height: 0.11.sh,)*/
          ],
        ),
      ),
    );
  }

  ///////////////////////AppBar Widget////////////////////////
  Widget _buildAppBar(BuildContext context,) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        title: SvgPicture.asset(
          'assets/svg/calz.svg',
          width: 60.w,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svg/notifications.svg',
                    width: 30.w,
                  ),
                  onPressed: () {
                    context.push('/notification');
                  },
                ),
                if (_notificationCount > 0)
                  Positioned(
                    right: 4,
                    top: -3,
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
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
  //////////////////////Calendar Widget////////////////////////
  Widget buildCalendar() {
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
      headerVisible: false,
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
            TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        weekendStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
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
      double width, double height, String svgPath, double circleWidth,double imageWidth) {return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xffEDEDED), width: circleWidth),
      ),
      child: Center(
        child: SvgPicture.asset(
          svgPath,
          width:imageWidth ,
        ),
      ),
    );}
  Widget _buildInfoCard(String value, String label, String svgPath) {
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
                  70.w, 70.h, svgPath, 5.w,28.w),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildRecentActivities() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //////////////////////////Minerals status///////////////////////
            Row(
              children: [
                Text(
                  "Minerals status",
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
            Card(
              elevation: 0,
              color: Color(0xffFAFAFA),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Major minerals",style: TextStyle(color: Color(0xff3285A1),fontWeight: FontWeight.w500,fontSize: 14.sp),),
                    SizedBox(height: 15.h,),
                    _buildMineralsstatusRow("Potassium (K)", "(12mg)"),
                    _buildMineralsstatusRow("Calcium (Ca)","(1mg)"),
                    _buildMineralsstatusRow("Magnesium (Mg)","(12mg)"),
                    _buildMineralsstatusRow("Phosphorus (P)","(12mg)"),
                    _buildMineralsstatusRow("Magnesium (Mg)","(12mg)"),
                    _buildMineralsstatusRow("Magnesium (Mg)","(12mg)"),
                    _buildMineralsstatusRow("Potassium (K)", "(12mg)"),
                    _buildMineralsstatusRow("Calcium (Ca)","(1mg)"),
                    _buildMineralsstatusRow("Magnesium (Mg)","(12mg)"),
                    SizedBox(height: 15.h,),
                    Text("Minor minerals",style: TextStyle(color: Color(0xff3285A1),fontWeight: FontWeight.w500,fontSize: 14.sp),),
                    SizedBox(height: 15.h,),
                    _buildMineralsstatusRow("Iron (Fe)", "(12mg)"),
                    _buildMineralsstatusRow("ZInc (Zn)","(1mg)"),
                    _buildMineralsstatusRow("Copper (Cu)","(12mg)"),
                    _buildMineralsstatusRow("Manganese (Mn)","(12mg)"),
                    _buildMineralsstatusRow("Selenium (Se)","(12mg)"),
                    _buildMineralsstatusRow("Iodine (I)","(12mg)"),
                    _buildMineralsstatusRow("Chromium (Cr)", "(12mg)"),
                    _buildMineralsstatusRow("Molybdenum (Mo)","(1mg)"),
                    _buildMineralsstatusRow("Fluoride (F)","(12mg)"),
                  ],
                ),
              ),
            ),
            ///////////////////////////////////Vitamins status row///////////////////////
            Row(
              children: [
                Text(
                  "Vitamins status",
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
            Card(
              elevation: 0,
              color: Color(0xffFAFAFA),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fat soluble-vitamins",style: TextStyle(color: Color(0xffB9B432),fontWeight: FontWeight.w500,fontSize: 14.sp),),
                    SizedBox(height: 15.h,),
                    _buildMineralsstatusRow("Vitamin A", "(12mg)"),
                    _buildMineralsstatusRow("Vitamin D2","(1mg)"),
                    _buildMineralsstatusRow("Vitamin D3","(12mg)"),
                    _buildMineralsstatusRow("Vitamin E","(12mg)"),
                    _buildMineralsstatusRow("Vitamin K1","(12mg)"),
                    _buildMineralsstatusRow("Vitamin K2","(12mg)"),
                    SizedBox(height: 15.h,),
                    Text("Water soluble-vitamins",style: TextStyle(color: Color(0xffB9B432),fontWeight: FontWeight.w500,fontSize: 14.sp),),
                    SizedBox(height: 15.h,),
                    _buildMineralsstatusRow("Vitamin C", "(12mg)"),
                    _buildMineralsstatusRow("Vitamin B2","(1mg)"),
                    _buildMineralsstatusRow("Vitamin B3","(12mg)"),
                    _buildMineralsstatusRow("Vitamin B5","(12mg)"),
                    _buildMineralsstatusRow("Vitamin B7","(12mg)"),
                    _buildMineralsstatusRow("Vitamin B8","(12mg)"),
                    _buildMineralsstatusRow("Vitamin D2","(1mg)"),
                    _buildMineralsstatusRow("Vitamin B9","(12mg)"),
                    _buildMineralsstatusRow("Vitamin B10","(12mg)"),
                    _buildMineralsstatusRow("Vitamin K1","(12mg)"),
                    _buildMineralsstatusRow("Vitamin K2","(12mg)"),
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
  Widget _buildRecentActivitieswhenempty() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent activities",
            style: TextStyle(fontSize: 18.spMin, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 0.02.sh),
          Card(
            elevation: 0,
            color: Color(0xffFAFAFA),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.016.sh,),
                  Center(child: Text("You haven't Upload any food",style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 18.sp),)),
                  Text("Start tracking today's meals by taking a quick picture",style: TextStyle(color: textColor,fontWeight: FontWeight.w400,fontSize: 16.sp),),
                  Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset('assets/svg/down_arrow.svg',width: .12.sw,),
                    ],
                  ),
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
  /// **🔻 Single Row for Nutrients**
  Widget _buildMineralsstatusRow(String name, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0xff30322E))),
          SizedBox(width: 15.w,),
          Expanded(child: Divider(color: Color(0xffEFEFEF),)),
          if (value.isNotEmpty)
            Text(
                value,
                style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,color: Color(0xff30322E))
            ),
        ],
      ),
    );
  }
}
