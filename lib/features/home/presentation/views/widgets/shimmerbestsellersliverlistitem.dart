import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBestSellerSliverListItem extends StatelessWidget {
  const ShimmerBestSellerSliverListItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap on shimmer item
      },
      child: Shimmer.fromColors(
        baseColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFFF5F5F5),
        child: SizedBox(
          height: height * 0.16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: width * 0.20,
                height: height * 0.16,
                decoration: BoxDecoration(
                  color: Colors.grey, // Adjust the color as needed
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: width * .04, // Adjust the height as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    Container(
                      height: width * .04, // Adjust the height as needed
                      color: Colors.grey, // Adjust the color as needed
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * .07, // Adjust the width as needed
                          height: height * .020, // Adjust the height as needed
                          color: Colors.grey, // Adjust the color as needed
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: width * .07, // Adjust the width as needed
                          height: height * .020, // Adjust the height as needed
                          color: Colors.grey, // Adjust the color as needed
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
