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
      required this.letterSpacing,
      required this.foregroundColor,
      this.side = 0});
  final void Function()? onPressed;
  final String string;
  final BorderRadius borderRadius;
  final Color color;
  final Color foregroundColor;
  final Color textcolor;
  final double fontSize;
  final double letterSpacing;
  final double side;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            foregroundColor: foregroundColor,
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            side: BorderSide(
                color: Color.fromARGB(255, 229, 167, 146), width: side)),
        child: Text(
          string,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textcolor,
              fontSize: fontSize,
              letterSpacing: letterSpacing),
        ),
      ),
    );
  }
}
