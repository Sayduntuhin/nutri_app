import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/forgetPassword/widgets/custom_appbar.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/custom_textField.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: .05.sh,
          ),
          buildAppbar(context,"Forget Password"),
          SizedBox(height: 20.h),
          Text(
            "Forget Password",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            "Enter your email address to reset your password.",
            style: TextStyle(fontSize: 14.sp, color: Color(0xff535353)),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomTextField(
                controller: emailController,
                hintText: "user@gmail.com",
                prefixIcon: Icons.mail),
          ),
          SizedBox(height: 0.05.sh),
          CustomButton(text: "Continue", onPressed: () {

            context.push("/varifications");
          })
        ],
      ),
    );
  }
}
