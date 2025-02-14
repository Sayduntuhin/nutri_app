import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/custom_textField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: .1.sh,
              ),
              Image.asset(
                'assets/images/signupimage.png',
                height: 160.h,
                width: 260.w,
              ),
              SizedBox(height: 30.h),
              Text(
                "Sign up",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Text(
                "Create your new account",
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
                          _rememberMe = value!;
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
                ],
              ),
              SizedBox(height: 0.07.sh),
              CustomButton(text: "Create", onPressed: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Color(0xff5A5A5A), fontSize: 14.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go("/login");
                    },
                    child: Text(
                      "Login",
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
    );
  }
}
