import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/forgetPassword/widgets/custom_appbar.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';
import 'package:nutri_app/views/widgets/custom_textField.dart';

import '../../../themes/text_size.dart';
import '../../widgets/secoundery_costom_appbar.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword ({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _rememberMe = false;

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              SizedBox(height: 0.05.sh,),
              Center(
                child: Text(
                  'Change Your Password',
                  style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 0.05.sh,),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("Old Password *",style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: CustomTextField(
                  controller: oldPasswordController,
                  hintText: "Password",
                  prefixIcon: Icons.lock,
                  isPassword: true,
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text("New Password *",style: TextStyle(fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: CustomTextField(
                  controller: newPasswordController,
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
              Spacer(flex: 8),
              Center(
            child: CustomButton(
              width: 340.w,
              text: "Change Password",
              onPressed: () {
                if (newPasswordController.text != confirmPasswordController.text) {
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
          ),
              Spacer()
        ],
      ),
    );
  }
}
