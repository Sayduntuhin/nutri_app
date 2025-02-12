import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/onbording/motherPage/multi_setip_page.dart';
import '../views/welcome/pages/welcome_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcomepage',
  routes: [
    GoRoute(
      path: '/welcomepage',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/mainpage',
      builder: (context, state) => MultiStepPage(),
    ),

  ],
);
