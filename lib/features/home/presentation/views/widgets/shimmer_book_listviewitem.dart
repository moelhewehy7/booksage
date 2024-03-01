import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookListViewItem extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerBookListViewItem(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Card(
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
      ),
    );
  }
}
