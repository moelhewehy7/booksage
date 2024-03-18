import 'package:flutter/material.dart';
import '../styles.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errormessage});
  final String errormessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errormessage,
        style: Styles.textStyle18,
      ),
    );
  }
}
