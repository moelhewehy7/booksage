import 'package:flutter/material.dart';
import '../../../domain/entities/book_entity.dart';
import 'paddedbooksdetailedcolumn.dart';
import 'similierbookslistview.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookentity});
  final BookEntity bookentity;
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                BooksDetailedColumn(
                  height: height,
                  width: width,
                  book: bookentity,
                ),
                Expanded(
                  child: SimilierBooksListView(
                    height: height,
                    width: width,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
