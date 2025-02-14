import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:nutri_app/themes/colours.dart';
import 'package:nutri_app/themes/text_size.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  @override
  State<RecommendationPage> createState() => _RecommendationPage();
}

class _RecommendationPage extends State<RecommendationPage> {
  final List<String> strategies = [
    "Boost your routine with health scores.",
    "Monitor your meals.",
    "Maintain your recommended calorie intake.",
    "Maintain dsfcd the right balance of carbs, protein, and fat."
  ];
  final List<ChartData> chartData = [
    ChartData('Carbs', 50, Color(0xffFF938B)),
    ChartData('Protein', 30, Color(0xffFFAE4C)),
    ChartData('Fats', 20, Color(0xff6ADEF5)),
  ];
  final dataMap = <String, double>{
    'Carbs' : 50,
    'Protein': 30,
    'Fats': 20,

  };

  final colorList = <Color>[
    Color(0xffFF938B),
    Color(0xffFFAE4C),
    Color(0xff6ADEF5)
  ];
  double healthScore = 7;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3F6FF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0,
        title: Text(
          "Back",
          style: TextStyle(
              color: textColor, fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 20.w, top: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.check_circle,
                  size: 50,
                  color: textColor,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Great news! Your personalized plan is ready!',
                style: TextStyle(
                    fontSize: textSize,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "Your weight gaining schedule:",
                  style: TextStyle(
                      fontSize: 14.sp, color: textColor, letterSpacing: 1.2),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Container(
                    width: 190,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffFBFCFF),
                    ),
                    child: Center(
                      child: Text(
                        "Lose 8kg by July 25, 2025",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: textColor,
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 30.h),
              Container(
                height: 310.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffFBFCFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                    )
                  ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      "Your Daily Recommendation",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "You can modify anything",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: textColor,
                          letterSpacing: 1.2),
                      textAlign: TextAlign.center,
                    ),
                 /*   SizedBox(
                      height: 220,
                      child: SfCircularChart(
                        annotations: <CircularChartAnnotation>[
                          CircularChartAnnotation(
                            widget: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: '1800 ',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: '\nkcal',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                        legend: Legend(
                            isVisible: true,
                            position: LegendPosition.right,
                            overflowMode: LegendItemOverflowMode.wrap,
                            legendItemBuilder: (String name, dynamic series,
                                dynamic point, int index) {
                              print("p_----------------print : ${point}");
                              return Container(
                                color: Colors.red,
                                width: 80,
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(40),
                                          color: point.color),
                                      height: 15,
                                      width: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          9.0, 8, 15, 9),
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                            color: textColor,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        series: <CircularSeries>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.name,
                            yValueMapper: (ChartData data, _) => data.value,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: TextStyle(fontSize: 12.sp),
                              labelAlignment: ChartDataLabelAlignment.auto,
                              labelPosition: ChartDataLabelPosition.outside,
                              connectorLineSettings: ConnectorLineSettings()
                            ),
                            radius: '90%',
                            innerRadius: '60%',
                            dataLabelMapper: (ChartData data, _) =>
                                '${data.value.toStringAsFixed(1)}%',
                            pointColorMapper: (ChartData data, _) => data.color,
                          )
                        ],
                      ),
                    ),*/
                    SizedBox(height: 20.h,),
                    Container(

                      height: 220,
                      child: PieChart(
                        centerText: "1800" ,
                        dataMap: dataMap,
                        ringStrokeWidth: 40,
                        chartType: ChartType.ring,
                        baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                        colorList: colorList,
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                        ),
                        totalValue: 3,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffFBFCFF),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2.0,
                      )
                    ]
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      "assets/svg/heart.png",
                      width: 36.w,
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Health Score",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$healthScore/10",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Spacer(flex: 2),
                    SizedBox(
                      width: 45.w,
                      height: 45.h,
                      child: CircularProgressIndicator(
                        value: healthScore / 10, // Max value is 10
                        strokeWidth: 12,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff090F03)),
                      ),
                    ),
                    SizedBox(width: 15.w),


                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Strategies to reach your goal",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              ...strategies.map((strategy) => _buildStrategyText(strategy)).toList(),
              SizedBox(height: 30.h),
              CustomButton(text: "Let's Begin!", onPressed: (){
                context.go('/login');
              }),



              SizedBox(height: 20.h,),

            ],
          ),
        ),
      ),
    );
  }
  Widget _buildStrategyText(String text) {
    return Row(
      children: [
        SizedBox(width: 10.w,),
       SvgPicture.asset("assets/svg/dot.svg",colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn) ,width: 5.w,),
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
          child: SizedBox(
            width: 0.8.sw,
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp),
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.name, this.value, this.color);
  final String name;
  final double value;
  final Color color;
}
