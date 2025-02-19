import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/colours.dart';

class SecounderyCostomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
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
          leadingWidth: 90.w,
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: onBackPressed,
              ),
              Text(
                "Back",
                style: TextStyle(color: textColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
