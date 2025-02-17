import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/forgetPassword/pages/forget_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/reset_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/varifications.dart';
import 'package:nutri_app/views/home/pages/home_page.dart';
import 'package:nutri_app/views/login/pages/login_page.dart';
import 'package:nutri_app/views/main/pages/main_page.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:nutri_app/views/recommendation/pages/recommendation_page.dart';
import 'package:nutri_app/views/signup/pages/sign_up_page.dart';
import '../views/foodScanner/pages/food_scanner_page.dart';
import '../views/welcome/pages/welcome_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcomepage',
  routes: [
    GoRoute(
      path: '/welcomepage',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/multisteppage',
      builder: (context, state) => MultiStepPage(),
    ),
    GoRoute(
      path: '/recommendation',
      builder: (context, state) => RecommendationPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: '/forgetpassword',
      builder: (context, state) => ForgetPassword(),
    ),
    GoRoute(
      path: '/varifications',
      builder: (context, state) => Varifications(),
    ),
    GoRoute(
      path: '/resetpassword',
      builder: (context, state) => ResetPassword(),
    ),
    GoRoute(
      path: '/homepage',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/mainpage',
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: '/foodscanner',
      builder: (context, state) => ScannerPage(),
    )
  ],
);
