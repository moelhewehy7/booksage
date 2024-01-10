import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/bestsellerlistviewitem.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Change this to the actual number of items
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: BestSellerSliverListItem(height: height, width: width),
        );
      },
    );
  }
}
