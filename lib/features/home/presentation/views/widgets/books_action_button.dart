import 'package:flutter/material.dart';
import 'package:reading/core/function/lunch_widget.dart';
import 'package:reading/core/utils/custombutton.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

import '../../../../../constants.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            string: 'Free',
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            onPressed: () {},
            color: const Color(0xFFFFE5DC),
            textcolor: kprimarycolor,
            fontSize: 15,
            letterSpacing: 1,
            foregroundColor: kprimarycolor,
          ),
        ),
        Expanded(
          child: CustomButton(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            string: gettext(bookEntity),
            onPressed: () async {
              await lunchurl(context, bookEntity.preview!);
            },
            color: const Color(0xFF7B574B),
            textcolor: Colors.white,
            fontSize: 14,
            letterSpacing: 0,
            foregroundColor: Colors.white,
          ),
        )
      ],
    );
  }

  String gettext(BookEntity bookEntity) {
    if (bookEntity.preview == null) {
      return "Preview Not Available";
    } else {
      return "Preview Available";
    }
  }
}
