import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Reusable custom text field widget
class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword; // Whether it's a password field or not

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false, // Default to false for non-password fields
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword; // Set password visibility based on isPassword
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white, // Background color
        ),
        child: TextField(
          controller: widget.controller,
          obscureText: _obscureText, // Toggle password visibility
          decoration: InputDecoration(
            prefixIcon: Icon(widget.prefixIcon, color: Colors.grey), // Prefix icon (e.g., email, lock)
            hintText: widget.hintText, // Hint text for the input field
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r), // Rounded corners
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // Toggle password visibility
                });
              },
            )
                : null, // No suffix icon for non-password fields
          ),
        ),
      ),
    );
  }
}
