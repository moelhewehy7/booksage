import 'package:flutter/material.dart';
import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/widgets/custombutton.dart';

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
        ? Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomButton(
              string: category,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onPressed: onpressed,
              color: const Color.fromARGB(255, 81, 39, 26),
              textcolor: const Color(0xFFFFFFFF),
              fontSize: 12,
              letterSpacing: 1,
              foregroundColor: kprimarycolor,
            ),
          )
        : Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomButton(
              string: category,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onPressed: onpressed,
              color: const Color.fromARGB(255, 255, 243, 239),
              textcolor: kprimarycolor,
              fontSize: 12,
              letterSpacing: 1,
              foregroundColor: kprimarycolor,
            ),
          );
  }
}
