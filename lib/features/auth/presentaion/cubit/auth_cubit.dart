import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signin({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginFaliure(
            title: "Can't find account",
            content:
                "We couldn't find your account. Please try another email, or if you don't have an account,you can sign up",
            text: "Ok"));
      } else if (e.code == 'wrong-password') {
        emit(const LoginFaliure(
            title: "Incorrect Password",
            content: "The password you entered is incorrect",
            text: "Try again"));
      } else {
        emit(const LoginFaliure(
            title: "Error", content: "Please try agin", text: "ok"));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    emit(SignupLoading());
    try {
      UserCredential usercredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseFirestore.instance
          .collection("Users")
          .doc(usercredential.user!.email)
          .set({"username": usercredential.user!.email!.split("@")[0]});
      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return emit(const Signupfailure(
            title: "Error",
            content: "'The password provided is too weak.'",
            text: "Ok"));
      } else if (e.code == 'email-already-in-use') {
        emit(const Signupfailure(
            title: "Error", content: "Email already exists", text: "Ok"));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchUserData() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("Users")
          .doc(currentUser.email)
          .get();
      Map<String, dynamic>? userData = snapshot.data();
      emit(UserDataLoaded(userData: userData));
    } catch (e) {
      // Handle the error
      emit(UserDatafailure(error: e.toString()));
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    emit(ResetpasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ResetpasswordSuccess(
          title: 'Password Reset Email Sent',
          content:
              'A password reset email has been sent to $email. Please sign in again!',
          buttonText: 'OK'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const Resetpasswordfailure(
          title: 'Error',
          content:
              'There is no user record corresponding to this email. Please check the email address.',
          buttonText: 'OK',
        ));
      } else {
        emit(const Resetpasswordfailure(
          title: 'Error',
          content:
              'Failed to send password reset email. Please try again later.',
          buttonText: 'OK',
        ));
      }
    }
  }
}
  //if mounted for if the context is still attached to the widget tree before showing the alert