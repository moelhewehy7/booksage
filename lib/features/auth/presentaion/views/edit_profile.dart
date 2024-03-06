import 'dart:io';

import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/app_router.dart';
import 'package:booksage/features/auth/presentaion/cubit/user_data_cubit/cubit/user_data_cubit.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/textfields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? first, last, bio;
  late String _imageUrl = '';
  final _picker = ImagePicker();
  ValueNotifier<String> _imageUrlNotifier = ValueNotifier<String>('');

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffececec),
        ),
        body: BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
          if (state is fetchUserDataloaded) {
            Map<String, dynamic>? userData = state.userData;
            return Form(
                key: formkey,
                child: ListView(children: [
                  Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: size.width,
                        color: const Color(0xffececec),
                        height: size.height * .15,
                      ),
                      Positioned(
                        top: size.height * .15 - 60,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFFE8CB),
                          radius: 60,
                          backgroundImage: _imageUrl.isEmpty
                              ? const AssetImage(
                                  'assets/images/default_avatar.jpg')
                              : NetworkImage(userData?["photoURL"])
                                  as ImageProvider,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              _pickImage();
                            },
                            child: const Text(
                              "Change profile photo",
                              style: TextStyle(
                                color: Color.fromARGB(255, 121, 92, 83),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          EditTextForm(
                            validator: (data) {
                              if (data == null || data.isEmpty) {
                                return 'Please enter your first name ';
                              } else if (data.length > 8) {
                                return 'first name must be at most 8 characters';
                              }
                              return null;
                            },
                            onSaved: (data) {
                              first = data;
                            },
                            icon: IconlyLight.profile,
                            hintText: "First name",
                            initialValue: userData?["firstname"] ?? "firstname",
                          ),
                          const SizedBox(height: 15),
                          EditTextForm(
                            validator: (data) {
                              if (data == null || data.isEmpty) {
                                return 'Please enter your last name ';
                              } else if (data.length > 8) {
                                return 'last name must be at most 8 characters';
                              }
                              return null;
                            },
                            onSaved: (data) {
                              last = data;
                            },
                            icon: IconlyLight.profile,
                            hintText: "Last name",
                            initialValue: userData?["lastname"] ?? "lastname",
                          ),
                          const SizedBox(height: 15),
                          EditTextForm(
                            validator: (data) {
                              if (data == null || data.isEmpty) {
                                return 'Please enter your bio ';
                              }
                              return null;
                            },
                            onSaved: (data) {
                              bio = data;
                            },
                            icon: IconlyLight.edit,
                            hintText: "Bio",
                            initialValue: state.userData?["bio"] ?? "add bio",
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: size.width - 35,
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  BlocProvider.of<UserDataCubit>(context)
                                      .updateUserData(
                                          bio: bio ?? userData?["bio"],
                                          firstname:
                                              first ?? userData?["firstname"],
                                          lastname:
                                              last ?? userData?["lastname"]);
                                  _uploadImage();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Color(0xFF5F433A),
                                      content:
                                          Text('Profile updated successfully'),
                                      duration: Duration(seconds: 4),
                                    ),
                                  );
                                  GoRouter.of(context)
                                      .pushReplacement(AppRouter.kHomeView);
                                }
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF5F433A),
                              ),
                              child: const Text(
                                "Update",
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          )
                        ],
                      ))
                ]));
          } else {
            return Center(
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20, child: CircularProgressIndicator())
                ],
              ),
            );
          }
        }));
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageUrlNotifier.value = pickedFile.path;
    }
  }

  Future<void> _uploadImage() async {
    if (_imageUrlNotifier.value.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      final fileName = user!.uid + DateTime.now().toString();
      final Reference ref =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');

      final uploadTask = ref.putFile(File(_imageUrlNotifier.value));

      await uploadTask.whenComplete(() => null);

      final downloadUrl = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .update({'photoURL': downloadUrl});

      _imageUrlNotifier.value = downloadUrl;
    }
  }
}
