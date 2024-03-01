import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/search/presentaion/views/widgets/book_category_listview.dart';
import 'package:reading/features/search/presentaion/views/widgets/custometextfield.dart';

import 'searchresultlistview.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextField(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height * 0.06,
                child: const BookCategoryListView(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Search Result",
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SearchResultListView(
          height: height,
          width: width,
        )
      ],
    );
  }
}
