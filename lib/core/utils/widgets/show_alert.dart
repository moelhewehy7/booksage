import 'package:flutter/material.dart';

showAlert(
  BuildContext context, {
  required String title,
  required String content,
  required String buttonText,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        content: Text(content),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D1D1D),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 13, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    },
  );
}
