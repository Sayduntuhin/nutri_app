import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double progress;
  final VoidCallback onBackPressed;

  const CustomAppBar({
    super.key,
    required this.progress,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Color(0xffF3F6FF),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow
            onPressed: onBackPressed, // Trigger the passed back function
          ),
          titleSpacing: 0,
          title: Text(
            "Back",
            style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SliderTheme(
                  data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.r),
                  ),
                  child: Slider(
                    value: progress,
                    min: 0,
                    max: 1,
                    divisions: 100,
                    onChanged: (double value) {},
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100.h);
}
