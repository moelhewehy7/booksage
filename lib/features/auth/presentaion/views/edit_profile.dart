import 'dart:io';
import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../cubit/user_data_cubit/cubit/user_data_cubit.dart';
import 'widgets/stackedprofilepic.dart';
import 'widgets/textfields.dart';
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
  bool _isLoading = false;

  final ValueNotifier<String> _imageUrlNotifier = ValueNotifier<String>("");

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AbsorbPointer(
      absorbing: _isLoading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffececec),
          ),
          body: BlocBuilder<UserDataCubit, UserDataState>(
              builder: (context, state) {
            if (state is UserDataSuccess) {
              Map<String, dynamic>? userData = state.userData;
              return Form(
                  key: formkey,
                  child: ListView(children: [
                    StackedProfilePic(
                        size: size,
                        imageUrlNotifier: _imageUrlNotifier,
                        userData: userData),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () async {
                                await pickImage();
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
                              initialValue:
                                  userData?["firstname"] ?? "firstname",
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
                                initialValue: userData?["bio"]),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: size.width - 35,
                              height: 50,
                              child: FilledButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    formkey.currentState!.save();
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    await _uploadImage();

                                    if (!context.mounted) return;

                                    Future.delayed(Duration.zero, () async {
                                      await BlocProvider.of<UserDataCubit>(
                                              context)
                                          .updateUserData(
                                              bio: bio ?? userData?["bio"],
                                              firstname: first ??
                                                  userData?["firstname"],
                                              lastname:
                                                  last ?? userData?["lastname"],
                                              url: _imageUrlNotifier.value == ""
                                                  ? userData!["photoUrl"]
                                                  : _imageUrlNotifier.value);
                                      Future.delayed(Durations.extralong1);
                                      if (context.mounted) {
                                        GoRouter.of(context).pushReplacement(
                                            AppRouter.kHomeView);
                                      }
                                      await BlocProvider.of<UserDataCubit>(
                                              context)
                                          .getUserData();
                                    });

                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xFF5F433A),
                                        content: Text(
                                            'Profile updated successfully'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );

                                    setState(() {
                                      _isLoading = false;
                                    });
                                  }
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF5F433A),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ))
                                    : const Text(
                                        "Update",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      ),
                              ),
                            )
                          ],
                        ))
                  ]));
            } else {
              return const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: kprimarycolor,
                      )));
            }
          })),
    );
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageUrlNotifier.value = pickedFile.path;
    } //sets the value to the file path of the picked image
  }

  Future<void> _uploadImage() async {
    if (_imageUrlNotifier.value.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      final fileName = user!.uid + DateTime.now().toString();
      //Generate a unique file name
      // Reference to the Firebase where the image will be stored,
      final Reference ref =
          FirebaseStorage.instance.ref().child('profile_images/$fileName');
      //upload the image file to Firebase,
      //File object representing the image file
      final uploadTask = ref.putFile(File(_imageUrlNotifier.value));
//Wait for the upload task to complete using
      await uploadTask.whenComplete(() => null);
//Get the download URL
      final downloadUrl = await ref.getDownloadURL();

      _imageUrlNotifier.value = downloadUrl;
    }
  }
}
