import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String text;
  const LoginButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.05),
        side: BorderSide(color: Colors.grey.shade800, width: .1),
        fixedSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
