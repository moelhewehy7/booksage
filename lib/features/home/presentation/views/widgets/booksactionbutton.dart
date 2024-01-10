import 'package:flutter/material.dart';
import 'package:reading/core/utils/custombutton.dart';

import '../../../../../constants.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            string: '19.9€',
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            onPressed: () {},
            color: const Color(0xFFFFE5DC),
            textcolor: kprimarycolor,
            fontSize: 20,
            letterSpacing: 1.2,
            foregroundColor: kprimarycolor,
          ),
        ),
        Expanded(
          child: CustomButton(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            string: 'Free Preview',
            onPressed: () {},
            color: const Color(0xFF7B574B),
            textcolor: Colors.white,
            fontSize: 18,
            letterSpacing: 0.1,
            foregroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
