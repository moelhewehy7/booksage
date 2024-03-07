import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  Future<void> sendUserData(
      {required String email,
      required String firstname,
      required String lastname}) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(email)
        .set({"firstname": firstname, "lastname": lastname});
  }

  Future<void> fetchUserData() async {
    emit(UserDataLoading());
    final currentUser = FirebaseAuth.instance.currentUser!;
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("Users")
        .doc(currentUser.email)
        .get();
    Map<String, dynamic>? userData = snapshot.data();
    emit(FetchUserDataloaded(userData: userData));
  }

  Future<void> updateUserData(
      {required String bio,
      required String firstname,
      required String lastname}) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser.email)
        .update({
      "firstname": firstname,
      "lastname": lastname,
      "bio": bio,
    });
  }
}
