import 'package:booksage/core/utils/styles.dart';
import 'package:booksage/features/auth/presentaion/cubit/user_data_cubit/cubit/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:booksage/animations/fade_in_slide.dart';
import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/app_router.dart';
import 'package:booksage/core/utils/widgets/show_alert.dart';
import 'package:booksage/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/button.dart';
import 'package:booksage/features/auth/presentaion/views/widgets/textfields.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool termsAccepted = false;
  String? email, password, first, last;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          GoRouter.of(context).push(AppRouter.kSignin);
        } else if (state is Signupfailure) {
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 20),
              FadeInSlide(
                duration: .3,
                child: Text(
                  "Create an Account",
                  style: Styles.textStyle25
                      .copyWith(color: kprimarycolor, fontSize: 23),
                ),
              ),
              const SizedBox(height: 15),
              FadeInSlide(
                duration: .4,
                child: Text(
                  "Start exploring a world of books!",
                  style: Styles.textStyle20
                      .copyWith(color: kprimarycolor, fontSize: 18),
                ),
              ),
              SizedBox(height: height * 0.02),
              const FadeInSlide(
                duration: .5,
                child: Text(
                  "First name",
                ),
              ),
              SizedBox(height: height * 0.01),
              FadeInSlide(
                duration: .5,
                child: EditTextForm(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please enter your first name ';
                    } else if (data.length > 8) {
                      return 'First name must be at most 8 characters';
                    }
                    return null;
                  },
                  onSaved: (data) {
                    first = data;
                  },
                  icon: IconlyLight.profile,
                  hintText: "First name",
                ),
              ),
              SizedBox(height: height * 0.02),
              const FadeInSlide(
                duration: .6,
                child: Text(
                  "Last name",
                ),
              ),
              SizedBox(height: height * 0.01),
              FadeInSlide(
                duration: .6,
                child: EditTextForm(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please enter your last name';
                    } else if (data.length > 8) {
                      return 'Last name must be at most 8 characters';
                    }
                    return null;
                  },
                  onSaved: (data) {
                    last = data;
                  },
                  icon: IconlyLight.profile,
                  hintText: "Last name",
                ),
              ),
              SizedBox(height: height * 0.02),
              const FadeInSlide(
                duration: .7,
                child: Text(
                  "Email",
                ),
              ),
              SizedBox(height: height * 0.01),
              FadeInSlide(
                duration: .7,
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
                  onchanged: (data) {
                    email = data;
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              const FadeInSlide(
                duration: .8,
                child: Text(
                  "Password",
                ),
              ),
              SizedBox(height: height * 0.01),
              FadeInSlide(
                duration: .8,
                child: PasswordField(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onchanged: (data) {
                    password = data;
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              const FadeInSlide(
                duration: .9,
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: .1,
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
              SizedBox(height: height * 0.02),
              FadeInSlide(
                duration: 1.0,
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
                  icon: Brand(Brands.twitter, size: 25),
                  text: "Continue with Twitter",
                  onPressed: () {},
                ),
              ),
              SizedBox(height: height * 0.07),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is SignupLoading) {
                return FilledButton(
                  onPressed: () {},
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
                        formkey.currentState!.save();
                        BlocProvider.of<AuthCubit>(context)
                            .signUp(email: email!, password: password!);
                        BlocProvider.of<UserDataCubit>(context).sendUserData(
                            email: email!, firstname: first!, lastname: last!);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF5F433A),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        // persistentFooterAlignment: AlignmentDirectional.center,
      ),
    );
  }
}
