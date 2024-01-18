import 'package:flutter/material.dart';

import 'shimmersimilierlistviewitem.dart';

class ShimmerSimilierBookListView extends StatelessWidget {
  const ShimmerSimilierBookListView(
      {super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.17,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
            child: ShimmerSimilierBookListViewItem(
              height: height,
              width: width * 0.2,
            ),
          );
        },
      ),
    );
  }
}
