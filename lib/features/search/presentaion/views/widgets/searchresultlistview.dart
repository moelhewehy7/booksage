import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
    required this.height,
    required this.width,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Change this to the actual number of items
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5,
          ),
          // child: BestSellerSliverListItem(height: height, width: width, bookModel: null,),
        );
      },
    );
  }
}
