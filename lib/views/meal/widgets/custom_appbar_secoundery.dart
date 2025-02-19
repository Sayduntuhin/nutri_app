import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/colours.dart';

class CustomAppbarSecoundery extends StatefulWidget implements PreferredSizeWidget {
  final String title;


  CustomAppbarSecoundery({
    super.key,
    required this.title,

  });

  @override
  State<CustomAppbarSecoundery> createState() => _CustomAppbarSecounderyState();

  @override
  Size get preferredSize => Size.fromHeight(50.h); // ✅ Properly implemented!
}

class _CustomAppbarSecounderyState extends State<CustomAppbarSecoundery> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 20.sp,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
