import 'package:booksage/animations/fade_in_slide.dart';
import 'package:booksage/core/utils/styles.dart';
import 'package:booksage/core/utils/widgets/show_alert.dart';
import 'package:booksage/features/auth/presentaion/cubit/auth_cubit.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/textfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetpasswordSuccess) {
          showAlert(context,
              title: state.title,
              content: state.content,
              buttonText: state.buttonText);
        } else {
          if (state is Resetpasswordfailure) {
            showAlert(context,
                title: state.title,
                content: state.content,
                buttonText: state.buttonText);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formkey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 20),
              const FadeInSlide(
                duration: .4,
                child: Text(
                  "Forgot Your Password 🔑",
                  style: Styles.textStyle20,
                ),
              ),
              const SizedBox(height: 15),
              const FadeInSlide(
                duration: .5,
                child: Text(
                  "We've got you covered. Enter your registered email to reset your password. We will send an OTP code to your email for the next steps.",
                ),
              ),
              const SizedBox(height: 25),
              const FadeInSlide(
                duration: .6,
                child: Text(
                  "Your Registered Email",
                ),
              ),
              const SizedBox(height: 10),
              FadeInSlide(
                duration: .7,
                child: TextForm(
                  valdiator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(data)) {
                      return 'Invalid email format.';
                    }
                    return null;
                  },
                  onchanged: (data) {
                    email = data;
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is ResetpasswordLoading) {
                return FilledButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .resetPassword(email: email!);
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF5F433A),
                    fixedSize: const Size(double.infinity, 50),
                  ),
                  child: const SpinKitCircle(
                    color: Colors.white,
                    size: 20.0,
                  ),
                );
              } else {
                return FadeInSlide(
                  duration: 1,
                  direction: FadeSlideDirection.ttb,
                  child: FilledButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .resetPassword(email: email!);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF5F433A),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Reset password",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
