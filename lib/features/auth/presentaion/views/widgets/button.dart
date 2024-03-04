import 'package:flutter/material.dart';
import 'package:reading/constants.dart';

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
    final brightness = MediaQuery.platformBrightnessOf(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(.05),
        side: BorderSide(color: Colors.grey.shade800, width: .1),
        fixedSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Spacer(),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: kprimarycolor),
          ),
          Spacer()
        ],
      ),
    );
  }
}
