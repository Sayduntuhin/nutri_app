import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_app/views/forgetPassword/widgets/custom_appbar.dart';
import 'package:nutri_app/views/widgets/custom_button.dart';

class Varifications extends StatefulWidget {
  Varifications({super.key});

  @override
  State<Varifications> createState() => _VarificationsState();
}

class _VarificationsState extends State<Varifications> {
  late List<TextEditingController> _otpControllers;
  late List<FocusNode> _focusNodes;
  bool _isResendEnabled = false;
  int _timeLeft = 60;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(4, (_) => TextEditingController());
    _focusNodes = List.generate(4, (_) => FocusNode());
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isResendEnabled = false;
      _timeLeft = 60;
    });
    Future.delayed(const Duration(seconds: 1), _decrementTime);
  }

  void _decrementTime() {
    if (mounted && _timeLeft > 0) {
      setState(() {
        _timeLeft--;
      });
      Future.delayed(const Duration(seconds: 1), _decrementTime);
    } else if (mounted) {
      setState(() {
        _isResendEnabled = true;
      });
      _timer?.cancel();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: .05.sh,
          ),
          buildAppbar(context,"Verification"),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "We have sent you an activation code.",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    "A SMS has been sent to your \nphone number containing a code to activate your account",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff535353)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Enter verification code",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 55,
                      height: 55,
                      decoration: new BoxDecoration (
                          borderRadius: new BorderRadius.all(new Radius.circular(80.0)),
                           border: Border.all( color: Color(0xffD9D9D9)),
                      ),
                      child: TextField(
                        controller: _otpControllers[index],
                        focusNode: _focusNodes[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 24, color: Colors.black),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                          counterText: '',
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("if you didn’t receive a code! ",style: TextStyle(
                      fontSize: 15.sp,color: Color(0xff767973),fontWeight: FontWeight.bold,
                    ),),
                    GestureDetector(
                      onTap: _isResendEnabled
                          ? () {
                        print('Resend OTP');
                        _startTimer();
                      }
                          : null,
                      child: Text(
                        'click here...',
                        style: TextStyle(
                          color: _isResendEnabled ? Colors.black : Color(0xff767973),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Code will expire soon',
                      style: const TextStyle(
                        color: Color(0xff090F03),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    Text(
                      '00:${_timeLeft.toString().padLeft(2, '0')}',
                      style: const TextStyle(
                        color: Color(0xff090F03),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomButton(width: 350.w,text: "Continue", onPressed: () {
            context.push('/resetpassword');

          }),
        ],
      ),
    );
  }
}
