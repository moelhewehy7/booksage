import 'package:flutter/material.dart';

class ShimmerBookListViewItem extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerBookListViewItem(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Add elevation or adjust as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
