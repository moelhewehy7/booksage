import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'appbar.dart';
import 'bookslistview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const CustomAppBar(),
        BooksListView(
          height: height,
          width: width,
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            children: [
              Text(
                "Best Seller",
                style: Styles.titlestyle,
              )
            ],
          ),
        )
      ],
    );
  }
}
