import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/analytics/pages/water_soluble_vitamins_bar_chart.dart';

import 'calorie_line_chart.dart';
import 'fat_soluble_vitamins_bae_chart.dart';
import 'macrominerals_bar_chart.dart';
import 'microminerals_bar_chart.dart';
import 'nutrition_bar_chat.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
        
          children: [
            LineChartSample2(),
            BarChartSample6(),
            MacromineralsBarChart(),
            MicromineralsBarChart(),
            VitaminConsumptionChart(),
            WaterSolubleVitaminsBarChart(),
            SizedBox(height: 150.h,)
        
          ],
        ),
      ),
    );
  }
}
