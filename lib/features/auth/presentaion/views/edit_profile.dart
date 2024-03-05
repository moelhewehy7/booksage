import 'package:booksage/features/auth/presentaion/cubit/auth_cubit.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? first, last, bio;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffececec),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
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
                  child: const CircleAvatar(
                    radius: 60,
                    child: Icon(IconlyLight.profile),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is UserDataLoaded) {
                    return Column(
                      children: [
                        TextButton(
                          onPressed: () {},
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
                            }
                            return null;
                          },
                          onSaved: (data) {
                            first = data;
                          },
                          icon: IconlyLight.profile,
                          hintText: "First name",
                          initialValue: state.userData?["username"],
                        ),
                        const SizedBox(height: 15),
                        EditTextForm(
                          validator: (data) {
                            if (data == null || data.isEmpty) {
                              return 'Please enter your last name ';
                            }
                            return null;
                          },
                          onSaved: (data) {
                            last = data;
                          },
                          icon: IconlyLight.profile,
                          hintText: "Last name",
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
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: size.width - 35,
                          height: 50,
                          child: FilledButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                formkey.currentState!.save();
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
                        ),
                      ],
                    );
                  } else if (state is UserDatafailure) {
                    return Text(state.error);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
