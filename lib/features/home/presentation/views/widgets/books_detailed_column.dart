import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_rating.dart';
import 'books_action_button.dart';

class BooksDetailedColumn extends StatelessWidget {
  const BooksDetailedColumn(
      {super.key,
      required this.height,
      required this.width,
      required this.book,
      required this.text});

  final double height;
  final double width;
  final BookEntity book;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          book.title,
          style: Styles.textStyle20,
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                book.authorName ?? "",
                style: Styles.textStyle16,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            BookRating(rating: book.avgrating ?? 0, count: book.rating ?? 0)
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        const SizedBox(
          height: 4,
        ),
        Card(
          elevation: 10,
          shadowColor: Colors.black,
          margin: const EdgeInsets.all(10),
          child: Container(
            height: height * .50,
            width: width,
            decoration: BoxDecoration(
              color: const Color(0xFFE7E7E7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: ExtendedImage.network(
                book.image ?? "",
                fit: BoxFit.fill,
                cache: true,
                loadStateChanged: (ExtendedImageState state) {
                  switch (state.extendedImageLoadState) {
                    case LoadState.completed:
                      return state.completedWidget;
                    case LoadState.failed:
                      return const Icon(Icons.error);
                    case LoadState.loading:
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BooksActionButton(bookEntity: book),
        const SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
