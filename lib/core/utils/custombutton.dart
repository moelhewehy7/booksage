import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.string,
      required this.borderRadius,
      required this.color,
      required this.textcolor,
      required this.fontSize,
      required this.letterSpacing});
  final void Function()? onPressed;
  final String string;
  final BorderRadius borderRadius;
  final Color color;
  final Color textcolor;
  final double fontSize;
  final double letterSpacing;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          "$string",
          style: TextStyle(
              color: textcolor,
              fontSize: fontSize,
              letterSpacing: letterSpacing),
        ),
        style: TextButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(12))),
      ),
    );
  }
}
