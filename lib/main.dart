import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nutri_app/routes/router.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.lazyPut<MultiStepPageController>(() => MultiStepPageController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          scaffoldBackgroundColor: Color(0xffF3F6FF),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffF3F6FF),
            foregroundColor: Color(0xffF3F6FF),
            surfaceTintColor: Color(0xffF3F6FF),
          )),
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
