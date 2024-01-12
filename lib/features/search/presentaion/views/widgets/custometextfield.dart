import 'package:flutter/material.dart';
import 'package:reading/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) async {},
      style: const TextStyle(
          color: Colors.white), // Set the color of the user input text
      decoration: InputDecoration(
        hintText: "Search ",
        hintStyle: TextStyle(color: Colors.white), // Hint text color
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: defaultborder(),
        focusedBorder: focusedborder(),
        filled: true,
        fillColor: Color(0xFF947064),
      ),
    );
  }

  OutlineInputBorder defaultborder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    );
  }

  OutlineInputBorder focusedborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: kprimarycolor));
  }
}