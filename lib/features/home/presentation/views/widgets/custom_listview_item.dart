import 'package:flutter/material.dart';

class CustomeListViewItem extends StatelessWidget {
  const CustomeListViewItem({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.35,
      height: height * 0.3,
      decoration: BoxDecoration(
        // image: DecorationImage(image: ),
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6), // Adjust the radius as needed
      ),
      child: const Center(
        child: Text(
          'Rounded Container',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
