import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSimilierBookListViewItem extends StatelessWidget {
  const ShimmerSimilierBookListViewItem({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
