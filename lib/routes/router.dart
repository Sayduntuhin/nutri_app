import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:nutri_app/views/forgetPassword/pages/change_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/forget_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/reset_password.dart';
import 'package:nutri_app/views/forgetPassword/pages/varifications.dart';
import 'package:nutri_app/views/home/pages/create_activity_page.dart';
import 'package:nutri_app/views/home/pages/daily_activity_page.dart';
import 'package:nutri_app/views/home/pages/home_page.dart';
import 'package:nutri_app/views/home/pages/notification_page.dart';
import 'package:nutri_app/views/login/pages/login_page.dart';
import 'package:nutri_app/views/main/pages/main_page.dart';
import 'package:nutri_app/views/meal/pages/add_meal_list_page.dart';
import 'package:nutri_app/views/onbording/child/pages/gender_page.dart';
import 'package:nutri_app/views/onbording/child/pages/weight_page.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import 'package:nutri_app/views/recommendation/pages/recommendation_page.dart';
import 'package:nutri_app/views/settings/pages/adjust_your_goal_page.dart';
import 'package:nutri_app/views/settings/pages/personal_details_page.dart';
import 'package:nutri_app/views/settings/pages/privacy_policy_page.dart';
import 'package:nutri_app/views/settings/pages/term_and_conditions_page.dart';
import 'package:nutri_app/views/signup/pages/sign_up_page.dart';
import '../views/foodScanner/pages/food_scanner_page.dart';
import '../views/foodScanner/pages/scan_result_page.dart';
import '../views/meal/pages/meal_details_page.dart';
import '../views/meal/pages/meal_page.dart';
import '../views/onbording/child/pages/date_pick_page.dart';
import '../views/onbording/child/pages/desire_weight.dart';
import '../views/onbording/child/pages/height_page.dart';
import '../views/onbording/child/pages/meal _timing_page.dart';
import '../views/onbording/child/pages/target_page.dart';
import '../views/welcome/pages/welcome_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcomepage',
  routes: [
    GoRoute(
      path: '/welcomepage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const WelcomeScreen()),
    ),
    GoRoute(
      path: '/multisteppage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const MultiStepPage()),
    ),
    GoRoute(
      path: '/recommendation',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const RecommendationPage()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const LoginPage()),
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const SignUpPage()),
    ),
    GoRoute(
      path: '/forgetpassword',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(ForgetPassword()),
    ),
    GoRoute(
      path: '/varifications',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(Varifications()),
    ),
    GoRoute(
      path: '/resetpassword',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(ResetPassword()),
    ),
    GoRoute(
      path: '/homepage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const HomePage()),
    ),
    GoRoute(
      path: '/mainpage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const MainPage()),
    ),
    GoRoute(
      path: '/foodscanner',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const ScannerPage()),
    ),
    GoRoute(
      path: '/personaldetails',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const PersonalDetailsPage()),
    ),
    GoRoute(
      path: '/termsandconditions',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const TermsAndConditionsPage()),
    ),
    GoRoute(
      path: '/privacypolicy',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const PrivacyPolicyPage()),
    ),
    GoRoute(
      path: '/adjustgoal',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const AdjustGoalPage()),
    ),
    GoRoute(
      path: '/addmeal',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const MealPage(isAddMealPage: true,)),
    ),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const MealPage(isAddMealPage: false,)),
    ),
    GoRoute(
      path: '/meal-details',
      pageBuilder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return _buildPageWithTransition(MealDetailsPage(
            mealType: data["mealType"],
            kaloriesAmount: data["kcal"],
            svgPath: data['svgpath']));
      },
    ),
    GoRoute(
      path: '/addmeallist',
      pageBuilder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return _buildPageWithTransition(
            AddMealListPage(mealType: data["mealType"]));
      },
    ),
    GoRoute(
      path: '/addtolog',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const AddMealListPage()),
    ),
    GoRoute(
      path: '/dailyactivitypage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const DailyActivityPage()),
    ),
    GoRoute(
      path: '/createactivitypage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const CreateActivityPage()),
    ),
    GoRoute(
      path: '/scanner',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const ScannerPage()),
    ),
    GoRoute(
      path: '/scanResult',
      pageBuilder: (context, state) {
        final Map<String, dynamic> data = state.extra as Map<String, dynamic>;
        return _buildPageWithTransition(
            ScanResultPage(imagePath: data["imagePath"]));
      },
    ),
    GoRoute(
      path: '/notification',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(const NotificationPage()),
    ),
    GoRoute(
      path: '/heightpage',
      pageBuilder: (context, state) => _buildPageWithTransition(HeightPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/weightpage',
      pageBuilder: (context, state) => _buildPageWithTransition(WeightPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/genderpage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(GenderSelectionPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/dateofbirthpage',
      pageBuilder: (context, state) => _buildPageWithTransition(DatePickerPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/targetpage',
      pageBuilder: (context, state) => _buildPageWithTransition(TargetPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/weightgoalpage',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(DesireWeightPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/mealtimepage',
      pageBuilder: (context, state) => _buildPageWithTransition(MealTimingPage(
        isOnboarding: false,
      )),
    ),
    GoRoute(
      path: '/changepassword',
      pageBuilder: (context, state) =>
          _buildPageWithTransition(ChangePassword()),
    ),
  ],
);

Page<void> _buildPageWithTransition(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
