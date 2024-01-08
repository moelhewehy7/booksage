import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'appbar.dart';
import 'bestsellerlistviewitem.dart';
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
          height: 40,
        ),
        const CustomAppBar(),
        const SizedBox(
          height: 16,
        ),
        BooksListView(
          height: height,
          width: width,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Best Seller",
                style: Styles.textStyle25,
              ),
              const SizedBox(
                height: 20,
              ),
              BestsellerlistViewItem(
                height: height,
                width: width,
              )
            ],
          ),
        )
      ],
    );
  }
}
