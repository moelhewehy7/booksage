import 'package:flutter/material.dart';
import 'package:reading/core/function/lunch%20widget.dart';
import 'package:reading/core/utils/custombutton.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';

import '../../../../../constants.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key, required this.bookmodel});
  final BookModel bookmodel;
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
            string: gettext(bookmodel),
            onPressed: () async {
              await lunchurl(context, bookmodel.volumeInfo.previewLink!);
            },
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

  String gettext(BookModel bookModel) {
    if (bookmodel.volumeInfo.previewLink == null) {
      return "Preview Not Available";
    } else {
      return "Preview Available";
    }
  }
}
