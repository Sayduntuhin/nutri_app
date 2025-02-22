import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/analytics/pages/water_soluble_vitamins_bar_chart.dart';
import 'calorie_line_chart.dart';
import 'fat_soluble_vitamins_bae_chart.dart';
import 'macrominerals_bar_chart.dart';
import 'microminerals_bar_chart.dart';
import 'nutrition_bar_chart.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    // Initial Selected Value
    String dropdownvalue = 'Calorie';

    // List of items in our dropdown menu
    var items = [
      'Calorie',
      'Nutrition',
      'Vitamins',
      'Minerals',
    ];
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50 , left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Analytics", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                  DropdownButton(

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            ChartWidget(),
            NutritionChart(),
            MacromineralsBarChart(),
            MicromineralsBarChart(),
            VitaminConsumptionChart(),
            WaterSolubleVitaminsBarChart(),
            SizedBox(height: 0.1.sh,)

          ],
        ),
      ),
    );
  }
}
