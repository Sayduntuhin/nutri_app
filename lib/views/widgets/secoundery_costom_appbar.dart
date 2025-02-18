import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecounderyCostomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBackPressed;

  const SecounderyCostomAppbar({
    super.key,
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
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
