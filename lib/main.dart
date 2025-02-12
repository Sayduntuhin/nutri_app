import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/routes/router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xffF3F6FF),
      ),
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: Size(408, 912),
          minTextAdapt: true,
          splitScreenMode: true,
        );
        return child!;
      },
    );
  }
}


