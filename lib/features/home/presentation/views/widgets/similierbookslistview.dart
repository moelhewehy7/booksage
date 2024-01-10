import 'package:flutter/material.dart';

import 'booklistviewitem.dart';

class SimilierBooksListView extends StatelessWidget {
  const SimilierBooksListView(
      {super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.17,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            child: BookListViewItem(height: height, width: width * 0.2),
          );
        },
      ),
    );
  }
}
