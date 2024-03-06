import 'package:booksage/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:booksage/animations/fade_in_slide.dart';
import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/app_router.dart';
import 'package:booksage/core/utils/widgets/show_alert.dart';
import 'package:booksage/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/button.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/textfields.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  // ValueNotifier<bool> termsCheck = ValueNotifier(false);
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        } else if (state is LoginFaliure) {
          showAlert(
            context,
            title: state.title,
            content: state.content,
            buttonText: state.text,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formkey,
          child: ListView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            children: [
              const SizedBox(height: 20),
              FadeInSlide(
                duration: .4,
                child: Text(
                  "Welcome Back! 👋",
                  style: Styles.textStyle25
                      .copyWith(color: kprimarycolor, fontSize: 23),
                  // style: context.hm!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              FadeInSlide(
                duration: .5,
                child: Text(
                  "Your next adventure awaits",
                  style: Styles.textStyle20
                      .copyWith(color: kprimarycolor, fontSize: 18),
                  // style: context.tm,
                ),
              ),
              const SizedBox(height: 25),
              const FadeInSlide(
                duration: .6,
                child: Text(
                  "Email",
                  // style: context.tm!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              FadeInSlide(
                  duration: .6,
                  child: EmailField(
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(data)) {
                        return 'Invalid email format.';
                      }
                      return null;
                    },
                    // In validation, returning null indicates that the input is valid
                    onchanged: (data) {
                      email = data;
                    },
                  )),
              const SizedBox(height: 20),
              const FadeInSlide(
                duration: .7,
                child: Text(
                  "Password",
                ),
              ),
              const SizedBox(height: 10),
              FadeInSlide(
                  duration: .7,
                  child: PasswordField(
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    // In validation, returning null indicates that the input is valid
                    onchanged: (data) {
                      password = data;
                    },
                  )),
              FadeInSlide(
                duration: .8,
                child: Row(
                  children: [
                    // ValueListenableBuilder(
                    //   valueListenable: termsCheck,
                    //   builder: (context, value, child) {
                    //     return CupertinoCheckbox(
                    //       activeColor: const Color.fromARGB(255, 112, 68, 53),
                    //       inactiveColor: kprimarycolor,
                    //       value: value,
                    //       onChanged: (_) {
                    //         termsCheck.value = !termsCheck.value;

                    //       },
                    //     );
                    //   },
                    // ),
                    // const Text(
                    //   "Remember Me",
                    // ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kForgotPassword);
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 121, 92, 83),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const FadeInSlide(
                duration: .9,
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: .3,
                    )),
                    Text(
                      "   or   ",
                    ),
                    Expanded(
                        child: Divider(
                      thickness: .3,
                    )),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              FadeInSlide(
                duration: 1,
                child: LoginButton(
                  icon: Brand(Brands.google, size: 25),
                  text: "Continue with Google",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: height * 0.02),
              FadeInSlide(
                duration: 1.2,
                child: LoginButton(
                  icon: Brand(Brands.facebook, size: 25),
                  text: "Continue with Facebook",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: height * 0.02),
              FadeInSlide(
                duration: 1.3,
                child: LoginButton(
                  icon: Brand(Brands.twitterx, size: 25),
                  text: "Continue with X",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: height * 0.05),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return FilledButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .signin(email: email!, password: password!);
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
                            .signin(email: email!, password: password!);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF5F433A),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Sign In",
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
