import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: ontap,
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
