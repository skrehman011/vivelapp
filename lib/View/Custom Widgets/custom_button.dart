import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.onPressed,
        required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: Device.width,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(7)),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: textStyle,
          )),
    );
  }
}
