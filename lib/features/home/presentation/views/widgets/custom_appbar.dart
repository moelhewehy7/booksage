import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            // Handle back button press
          },
          child: const Padding(
            padding: EdgeInsets.zero, // Adjust padding as needed
            child: Icon(Icons.keyboard_backspace, size: 30),
          ),
        ),
        InkWell(
          onTap: () {
            // Handle cart button press
          },
          child: const Padding(
            padding: EdgeInsets.zero, // Adjust padding as needed
            child: Icon(Icons.shopping_cart, size: 30),
          ),
        ),
      ],
    );
  }
}
