import 'package:flutter/material.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';
import 'paddedbooksdetailedcolumn.dart';
import 'similierbookslistview.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
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
                BooksDetailedColumn(
                  height: height,
                  width: width,
                  book: bookModel,
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
