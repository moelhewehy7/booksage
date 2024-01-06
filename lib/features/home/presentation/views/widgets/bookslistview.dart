import 'package:flutter/material.dart';

import 'listviewitem.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.width, required this.height});
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: ListViewItem(width: width, height: height),
          );
        },
      ),
    );
  }
}
