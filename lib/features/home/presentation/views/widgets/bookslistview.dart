import 'package:flutter/material.dart';

import 'booklistviewitem.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.width, required this.height});
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 0.00001,
            blurRadius: 50,
            offset: const Offset(5, 25),
          ),
        ],
      ),
      height: height * 0.3,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 6),
            child: BookListViewItem(width: width, height: height),
          );
        },
      ),
    );
  }
}
