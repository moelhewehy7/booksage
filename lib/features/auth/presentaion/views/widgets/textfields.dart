import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      // cursorColor: isDark ? Colors.grey : Colors.black54,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(.1),
        hintText: "Password",
        prefixIcon: const Icon(IconlyLight.lock, size: 20),
        suffixIcon: const Icon(IconlyLight.hide, size: 20),
        // prefixIconColor: isDark ? Colors.white : Colors.black87,
        // suffixIconColor: isDark ? Colors.white : Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      // cursorColor: isDark ? Colors.grey : Colors.black54,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blueGrey.withOpacity(.1),
        hintText: "Email",
        prefixIcon: const Icon(IconlyLight.message, size: 20),
        // prefixIconColor: isDark ? Colors.white : Colors.black87,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
