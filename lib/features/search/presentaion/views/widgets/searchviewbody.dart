import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/search/presentaion/views/widgets/custometextfield.dart';

import 'searchresultlistview.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(),
          SizedBox(
            height: 10,
          ),
          Text(
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
