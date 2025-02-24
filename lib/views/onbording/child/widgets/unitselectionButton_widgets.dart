import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnitSelectionButton extends StatelessWidget {
  final String unitText; // The text for the unit (e.g., "Centimeter")
  final String selectedUnit; // The selected unit (used to determine the color)
  final Function(String) onUnitSelect; // Callback function for when the button is pressed
   final double width ;
  const UnitSelectionButton({
    super.key,
    required this.unitText,
    required this.selectedUnit,
    required this.onUnitSelect,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: width,
      child: ElevatedButton(
        onPressed: () => onUnitSelect(unitText),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
          elevation: 0,
          backgroundColor:
          selectedUnit == unitText ? Colors.black : const Color(0xffF3F6FF),
        ),
        child: Text(
          unitText,
          style: TextStyle(
            color: selectedUnit == unitText ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
