import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/custom_textField.dart';
import '../../../themes/text_size.dart';
import '../../widgets/custom_loading_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false; // Loading state variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: .07.sh),
                  Text(
                    'Let’s follow Cal Z',
                    style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Eat healthy, Stay healthy',
                    style: TextStyle(fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  Image.asset(
                    'assets/images/loginImage.png',
                    height: 100.h,
                    width: 190.w,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Login to your account",
                    style: TextStyle(fontSize: 14.sp, color: Color(0xff535353)),
                  ),
                  SizedBox(height: 40.h),
                  CustomTextField(
                      controller: emailController,
                      hintText: "user@gmail.com",
                      prefixIcon: Icons.email),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    isPassword: true,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!; // Remember me checkbox
                            });
                          },
                          activeColor: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Remember me",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff6B6B6B),
                              letterSpacing: 1.2),
                        ),
                      ),
                      Spacer(flex: 2),
                      TextButton(
                        onPressed: () {
                          context.push('/forgetpassword');
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.07.sh),
                  // Show login button only when not loading
                  if (!_isLoading)
                    CustomButton(
                      width: 350.w,
                      text: "Login",
                      onPressed: () async {
                        setState(() {
                          _isLoading = true; // Start loading
                        });

                        // Simulate login process (replace with actual logic)
                        await Future.delayed(Duration(seconds: 3));

                        setState(() {
                          _isLoading = false; // End loading
                        });

                        context.go('/mainpage');
                      },
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Color(0xff5A5A5A), fontSize: 14.sp),
                      ),
                      TextButton(
                        onPressed: () {
                          context.push("/signup");
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Color(0xff090F03),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Custom Loading indicator centered on the screen
          if (_isLoading)
            Center(
              child: CustomLoadingIndicator(
                size: 60.0,
                color: Colors.black, // You can customize the color and size here
              ),
            ),
        ],
      ),
    );
  }
}
