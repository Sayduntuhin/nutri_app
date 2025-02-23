import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/meal/pages/meal_page.dart';
import 'package:nutri_app/views/settings/pages/setting_page.dart';
import '../../analytics/pages/analytics_page.dart';
import '../../home/pages/home_page.dart';
import '../widgets/custom_nav_bar.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(), AnalyticsPage(), const MealPage( isAddMealPage:  false,), const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: .04.sh,left: 0.8.sw),
        child: FloatingActionButton(
          onPressed: () {
            context.push("/foodscanner");
          },
          shape:  CircleBorder(),
          backgroundColor: Colors.black,
          child: SvgPicture.asset('assets/svg/scan.svg'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Move FAB to bottom center
// Display the page based on selected tab
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Update the current index when a tab is clicked
          });
        },
      ),
    );
  }
}
