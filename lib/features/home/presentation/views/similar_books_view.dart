import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

import 'widgets/paddedbooksdetailedcolumn.dart';

class SimilarBooksView extends StatelessWidget {
  const SimilarBooksView({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
              child: Column(
                children: [
                  BooksDetailedColumn(
                    height: height,
                    width: width,
                    book: bookEntity,
                    text: "Description",
                  ),
                  Text(bookEntity.description ?? "bookEntity not available",
                      style: Styles.textStyle25
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 20))
                ],
              ),
            ))
      ]),
    );
  }
}
