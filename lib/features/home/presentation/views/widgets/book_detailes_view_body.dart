import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';
import 'books_detailed_column.dart';
import 'similier_books_listview.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookentity});
  final BookEntity bookentity;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BooksDetailedColumn(
                    height: height,
                    width: width,
                    book: bookentity,
                    text: "You can also like",
                  ),
                ),
                SimilierBooksListView(
                  height: height,
                  width: width,
                ),
              ],
            ))
      ],
    );
  }
}
