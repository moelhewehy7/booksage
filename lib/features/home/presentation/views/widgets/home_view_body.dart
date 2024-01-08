import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'appbar.dart';
import 'bestsellerlistview.dart';
import 'bookslistview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const CustomAppBar(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BooksListView(
                height: height,
                width: width,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Best Seller",
                  style: Styles.textStyle25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        BestSellerListView(height: height, width: width)
      ],
    );
  }
}
