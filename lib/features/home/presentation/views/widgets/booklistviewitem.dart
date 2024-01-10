import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // image: DecorationImage(image: ),
        color: Colors.brown,
        borderRadius: BorderRadius.circular(6), // Adjust the radius as needed
      ),
      child: const Center(
        child: Text(
          'Rounded Container',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
