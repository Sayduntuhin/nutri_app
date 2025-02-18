import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/colours.dart';

class CustomAppbarSecoundery extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPressed;

  CustomAppbarSecoundery({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  State<CustomAppbarSecoundery> createState() => _CustomAppbarSecounderyState();

  @override
  Size get preferredSize => Size.fromHeight(60.h); // ✅ Properly implemented!
}

class _CustomAppbarSecounderyState extends State<CustomAppbarSecoundery> {
  @override
  Widget build(BuildContext context) {
    int _notificationCount = 3;
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black), // Back arrow
        onPressed: widget.onBackPressed, // Trigger the passed back function
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 20.sp,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
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
              onPressed: () {},
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
    );
  }
}
