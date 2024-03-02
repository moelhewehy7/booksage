import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reading/constants.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:readmore/readmore.dart';

import 'widgets/books_detailed_column.dart';
import 'widgets/read_more.dart';

class SimilarBooksView extends StatelessWidget {
  const SimilarBooksView({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          // prevent the SliverAppBar from changing its background color to a darker shade
          background: Container(
            color: const Color(0xFFfffbfe),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Padding(
              padding: EdgeInsets.zero, // Adjust padding as needed
              child: Icon(Icons.keyboard_backspace, size: 30),
            ),
          ),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
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
              ReadMore(
                text: bookEntity.description ?? "bookEntity not available",
              )
            ],
          ),
        ))
      ]),
    );
  }
}
