import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/forgetPassword/pages/forget_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/reset_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/varifications.dart';
import 'package:nutri_app/views/home/pages/create_activity_page.dart';
import 'package:nutri_app/views/home/pages/daily_activity_page.dart';
import 'package:nutri_app/views/home/pages/home_page.dart';
import 'package:nutri_app/views/login/pages/login_page.dart';
import 'package:nutri_app/views/main/pages/main_page.dart';
import 'package:nutri_app/views/meal/pages/add_meal_list_page.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:nutri_app/views/recommendation/pages/recommendation_page.dart';
import 'package:nutri_app/views/settings/pages/adjust_your_goal_page.dart';
import 'package:nutri_app/views/settings/pages/personal_details_page.dart';
import 'package:nutri_app/views/settings/pages/privacy_policy_page.dart';
import 'package:nutri_app/views/settings/pages/term_and_conditions_page.dart';
import 'package:nutri_app/views/signup/pages/sign_up_page.dart';
import '../views/foodScanner/pages/food_scanner_page.dart';
import '../views/meal/pages/meal_details_page.dart';
import '../views/meal/pages/meal_page.dart';
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
    ),
    GoRoute(
      path: '/personaldetails',
      builder: (context, state) => PersonalDetailsPage(),
    ),   GoRoute(
      path: '/termsandconditions',
      builder: (context, state) => TermsAndConditionsPage(),
    ), GoRoute(
      path: '/privacypolicy',
      builder: (context, state) => PrivacyPolicyPage(),
    ),
    GoRoute(
      path: '/adjustgoal',
      builder: (context, state) => AdjustGoalPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const MealPage(),
    ),
    GoRoute(
      path: '/meal-details',
      builder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>; // ✅ Receive map
        return MealDetailsPage(mealType: data["mealType"], kaloriesAmount: data["kcal"], svgPath: data['svgpath'],);
      },
    ),
    GoRoute(
      path: '/addmeallist',
      builder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return AddMealListPage(mealType: data["mealType"]); // ✅ Pass mealType dynamically
      },
    ),
    GoRoute(
      path: '/dailyactivitypage',
      builder: (context, state) => const DailyActivityPage(),
    ),
  GoRoute(
      path: '/createactivitypage',
      builder: (context, state) => const CreateActivityPage(),
    ),


  ],
);
