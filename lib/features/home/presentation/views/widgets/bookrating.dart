import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xfffedb4d),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          bookModel.volumeInfo.ratingsCount.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Text(
          "(${bookModel.volumeInfo.averageRating.toString()})",
          style: Styles.textStyle14.copyWith(color: const Color(0xff6b6a79)),
        )
      ],
    );
  }
}
