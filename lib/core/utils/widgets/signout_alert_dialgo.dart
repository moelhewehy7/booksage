import '../../../constants.dart';
import '../app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void signoutdialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Are you sure you want to sign out",
              style: TextStyle(fontSize: 21, fontFamily: "Roboto")),
          actions: [
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: Colors.white),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 47, 64, 73)),
                )),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                GoRouter.of(context).pushReplacement(AppRouter.kGetStartedView);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  backgroundColor: kbuttoncolor),
              child: const Text("Sign out",
                  style: TextStyle(fontSize: 15, color: Colors.white)),
            )
          ],
        );
      });
}
