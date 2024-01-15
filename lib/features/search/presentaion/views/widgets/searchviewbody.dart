import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextField(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          Expanded(
            child: SearchResultListView(
              height: height,
              width: width,
            ),
          )
        ],
      ),
    );
  }
}
