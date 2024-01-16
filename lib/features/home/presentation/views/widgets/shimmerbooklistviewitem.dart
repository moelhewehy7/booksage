import 'package:flutter/material.dart';

class ShimmerBookListViewItem extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerBookListViewItem(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
