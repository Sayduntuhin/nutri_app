import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/forgetPassword/widgets/custom_appbar.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/custom_textField.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword ({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _rememberMe = false;

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: .05.sh,
          ),
          buildAppbar(context,"Reset Password"),
          SizedBox(height: .06.sh),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("New Password *",style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: CustomTextField(
                    controller: passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                  isPassword: true,
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("Confirm New Password *",style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                  isPassword: true,
                ),
              ),
            ],
          ),

          SizedBox(height: 0.05.sh),
          CustomButton(
            width: 350.w,
            text: "Save Password",
            onPressed: () {
              if (passwordController.text != confirmPasswordController.text) {
                // Show snackbar if passwords do not match
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Passwords do not match."),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                // Navigate to verification screen if passwords match
                context.go("/login");
              }
            },
          ),
        ],
      ),
    );
  }
}
