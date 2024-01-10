import 'package:flutter/material.dart';
import 'PaddedBooksDetailedColumn.dart';
import 'similierbookslistview.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key});

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
                PaddedBooksDetailedColumn(height: height, width: width),
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
