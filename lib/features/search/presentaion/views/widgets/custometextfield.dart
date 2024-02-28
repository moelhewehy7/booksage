import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/constants.dart';
import '../../../../home/presentation/manager/search cubit/search_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        BlocProvider.of<SearchCubit>(context).fetchBookbysearch(book: value);
      },
      style: const TextStyle(
          color: Colors.white), // Set the color of the user input text
      decoration: InputDecoration(
        hintText: "Search ",
        hintStyle: const TextStyle(color: Colors.white), // Hint text color
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: defaultborder(),
        focusedBorder: focusedborder(),
        filled: true,
        fillColor: const Color(0xFF947064),
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
