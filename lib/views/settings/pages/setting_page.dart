import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: ListView(
          children: [
            SizedBox(height: 0.03.sh),
            _buildSectionTitle("Settings"),
            SizedBox(height: 0.03.sh),
            _buildListTile("Terms & Conditions", () {
              context.push('/termsandconditions');
            }),
            _buildListTile("Privacy Policy", () {
              context.push('/privacypolicy');
            }),
            _buildListTile("Delete Account", () {
              _showDeleteDialog(context); // Show delete confirmation dialog
            }),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 15, top: 15),
              child: _buildSectionTitle("Customization"),
            ),
            _buildListTile("Personal Details", () {
              context.push('/personaldetails');
            }),
            _buildListTile("Adjust nutrients goals", () {
              context.push('/adjustgoal');
            }),
            _buildListTile("Your meal time",() {
              context.push('/mealtimepage');
            }),
            _buildListTile("Log Out",(){
              _showLogoutDialog(context);
            }),
          ],
        ),
      ),
    );
  }

  // Show the Delete Account dialog
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          insetPadding: EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.01.sh), // Adjust horizontal padding to change width
          child: Container(
            width: 250.w, // Set a custom width for the dialog
            padding: EdgeInsets.all(15.w), // Internal padding for content
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Delete Account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                // Content
                Text(
                  'Are you sure to permanently delete your \naccount?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cancel Button
                    Expanded(
                      child: Container(
                        height: 0.05.sh,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                   SizedBox(width: 10.w,),
                    // Delete Button
                    Expanded(
                      child: Container(
                        height: 0.05.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.black,
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Handle account deletion here
                          },
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          insetPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h), // Adjust horizontal padding to change width
          child: Container(
            width: 250.w, // Set a custom width for the dialog
            padding: EdgeInsets.all(15.w), // Internal padding for content
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Log Out?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                // Content
                Text(
                  'Are you sure you want to log out?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Cancel Button
                    Expanded(
                      child: Container(
                        height: 0.05.sh,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: 10,),
                    // Delete Button
                    Expanded(
                      child: Container(
                        height: 0.05.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.black,
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.go('/login');
                            Navigator.of(context).pop(); // Close the dialog
                      
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Reusable ListTile widget
  Widget _buildListTile(String title, [Function()? onTap]) {
    return SizedBox(
      height: 0.06.sh,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18.sp),
        onTap: onTap ?? () {},
      ),
    );
  }

  // Section title style
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }
}
