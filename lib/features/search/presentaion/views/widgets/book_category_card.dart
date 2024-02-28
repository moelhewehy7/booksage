import 'package:flutter/material.dart';
import 'package:reading/constants.dart';
import 'package:reading/core/utils/custombutton.dart';

class BookCategoryCard extends StatelessWidget {
  const BookCategoryCard(
      {super.key,
      required this.category,
      required this.isActive,
      required this.onpressed});
  final bool isActive;
  final String category;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CustomButton(
              side: 3,
              string: category,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onPressed: onpressed,
              color: const Color(0xFF5A4037),
              textcolor: const Color(0xFFFFFFFF),
              fontSize: 15,
              letterSpacing: 1,
              foregroundColor: kprimarycolor,
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CustomButton(
              string: category,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onPressed: onpressed,
              color: const Color(0xFF5A4037),
              textcolor: const Color(0xFFFFFFFF),
              fontSize: 15,
              letterSpacing: 1,
              foregroundColor: kprimarycolor,
            ),
          );
  }
}
