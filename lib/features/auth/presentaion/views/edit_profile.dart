import 'dart:io';
import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/app_router.dart';
import 'package:booksage/features/auth/presentaion/cubit/user_data_cubit/cubit/user_data_cubit.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/textfields.dart';
import 'package:extended_image/extended_image.dart';
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
                          child: ValueListenableBuilder<String>(
                            valueListenable: _imageUrlNotifier,
                            builder: (context, imageUrl, child) {
                              return CircleAvatar(
                                backgroundColor: const Color(0xFFf1f2f3),
                                radius: 60,
                                // This code checks if imageUrl is not empty and does not start with 'http'
                                // (which means it's a local file path) before using Image.file to display the local image.
                                //  Otherwise, it uses Image.network to display the image from the URL.
                                child: ClipOval(
                                  child: imageUrl.isNotEmpty &&
                                          !imageUrl.startsWith('http')
                                      ? Image.file(
                                          File(imageUrl),
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        )
                                      : ExtendedImage.network(
                                          _imageUrlNotifier.value.isEmpty
                                              ? userData!["photoUrl"]
                                              : _imageUrlNotifier.value,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                          loadStateChanged:
                                              (ExtendedImageState state) {
                                            switch (
                                                state.extendedImageLoadState) {
                                              case LoadState.completed:
                                                return state.completedWidget;
                                              case LoadState.failed:
                                                return const Icon(Icons.error);
                                              case LoadState.loading:
                                                return const Center(
                                                  child: SizedBox(
                                                    height: 15,
                                                    width: 15,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 3,
                                                      color: kprimarycolor,
                                                    ),
                                                  ),
                                                );
                                            }
                                          },
                                        ),
                                ),
                              );
                            },
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

      _imageUrlNotifier.value = downloadUrl;
    }
  }
}
