import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nutri_app/views/widgets/secoundery_costom_appbar.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:SecounderyCostomAppbar(onBackPressed: Navigator.of(context).pop,),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          children: [
            _buildSectionTitle("Terms and Conditions"),
            SizedBox(height: 25.h,),
            _buildListItem("Welcome to Ai. By using our services, you agree to abide by the terms and conditions outlined below. These terms govern your access to and use of Ai tools and services, so please review them carefully before proceeding."),
            _buildListItem("Ai provides innovative tools designed to enhance how you capture and manage voice recordings. Our services include voice-to-text transcription and AI-driven summarization, which are intended for lawful, ethical purposes only."),
            _buildListItem("You must ensure compliance with applicable laws, including obtaining consent from all participants when recording conversations. CleverTalk disclaims liability for any misuse of its tools."),
            _buildListItem("The terms and conditions may be updated or modified periodically. It is your responsibility to check for updates regularly and stay informed of any changes."),
            _buildListItem("By continuing to use our services, you acknowledge that you have read and understood these terms and agree to comply with them."),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }
}
  // Reusable method to build each list item
  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•', // Bullet point symbol
            style: TextStyle(fontSize: 18.sp, color: Colors.black),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
              textAlign: TextAlign.justify, // Align text to justify
            ),
          ),
        ],
      ),
    );
  }

