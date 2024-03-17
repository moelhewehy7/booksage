import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  String? photoURL;
  StreamSubscription<DocumentSnapshot>? _userDataSubscription;
  Future<void> sendUserData(
      {required String email,
      required String firstname,
      required String lastname}) async {
    await FirebaseFirestore.instance.collection("Users").doc(email).set({
      "firstname": firstname,
      "lastname": lastname,
      "photoUrl":
          "https://www.hawkeyemetalspinning.com/wp-content/uploads/2022/12/male.jpg"
    });
  }

  Future<void> updateUserData(
      {required String bio,
      required String firstname,
      required String lastname,
      required String url}) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser.email)
        .update({
      "firstname": firstname,
      "lastname": lastname,
      "bio": bio,
      "photoUrl": url
    });
  }

  Future<void> getUserData() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // the user's profile picture should update correctly when they log in with a new account.
        emit(UserDataLoading());
        _userDataSubscription = FirebaseFirestore.instance
            .collection("Users")
            .doc(user.email)
            .snapshots()
            .listen((snapshot) {
          emit(UserDataSuccess(userData: snapshot.data()));
        });
      } else {
        emit(UserDataFailure());
      }
    });
  }

//  to cancel the stream subscription when needed to avoid memory leaks.
  void disposeSubscription() {
    _userDataSubscription?.cancel();
  }
}
  // Future<void> fetchUserData() async {
  //   emit(UserDataLoading());

  //   final currentUser = FirebaseAuth.instance.currentUser!;
  //   // Cancel previous subscription if exists
  //   FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc(currentUser.email)
  //       .snapshots()
  //       .listen((event) {
  //     Map<String, dynamic>? userData = event.data();
  //     emit(FetchUserDataloaded(userData: userData));
  //   });
  // }