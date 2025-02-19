import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,bottom: 25,top: 20, right: 15),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xff090F03),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Icon
              _buildIcon(
                'assets/svg/home.svg',
                'Home',
                0,
                24.w
              ),
              // Analytics Icon
              _buildIcon(
                'assets/svg/anl.svg',
                'Analytics',
                1,
                24.w
              ),
              // Meal Icon
              _buildIcon(
                'assets/svg/meal.svg',
                'Meal',
                2,
                24.w
              ),
              // Settings Icon
              _buildIcon(
                'assets/svg/setting.svg',
                'Settings',
                3,
                24.w
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A helper method to build each item in the navigation bar
  Widget _buildIcon(String svgPath, String label, int index,double svgWidth) {
    bool isSelected = index == currentIndex; // Check if this item is selected

    return GestureDetector(
      onTap: () => onTap(index), // Handle tap to change current index
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgPath,
            width: svgWidth,
            colorFilter: isSelected ? const ColorFilter.mode(Colors.white, BlendMode.srcIn) : const ColorFilter.mode(Colors.grey, BlendMode.srcIn), // Selected and unselected icon color
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey, // Selected and unselected label color
              fontWeight: isSelected ? FontWeight.normal : FontWeight.normal, // Bold if selected
            ),
          ),
        ],
      ),
    );
  }
}