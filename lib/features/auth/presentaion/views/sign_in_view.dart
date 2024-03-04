import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reading/animations/fade_in_slide.dart';
import 'package:reading/constants.dart';
import 'package:reading/features/auth/presentaion/views/widgets/button.dart';
import 'package:reading/features/auth/presentaion/views/widgets/textfields.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  ValueNotifier<bool> termsCheck = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            const FadeInSlide(
              duration: .4,
              child: Text(
                "Welcome Back! 👋",
                // style: context.hm!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            const FadeInSlide(
              duration: .5,
              child: Text(
                "Your Smart Home, Your Rules",
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
            const FadeInSlide(duration: .6, child: EmailField()),
            const SizedBox(height: 20),
            const FadeInSlide(
              duration: .7,
              child: Text(
                "Password",
                // style: context.tm!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            const FadeInSlide(duration: .7, child: PasswordField()),
            const SizedBox(height: 20),
            FadeInSlide(
              duration: .8,
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: termsCheck,
                    builder: (context, value, child) {
                      return CupertinoCheckbox(
                        inactiveColor: isDark ? Colors.white : Colors.black87,
                        value: value,
                        onChanged: (_) {
                          termsCheck.value = !termsCheck.value;
                        },
                      );
                    },
                  ),
                  const Text(
                    "Remember Me",
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: kprimarycolor),
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
            SizedBox(height: height * 0.04),
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
            SizedBox(height: height * 0.04),
          ]),
      bottomNavigationBar: FadeInSlide(
        duration: 1,
        direction: FadeSlideDirection.btt,
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: .2, color: Colors.grey),
            ),
          ),
          child: FilledButton(
            onPressed: () async {},
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF7B574B),
              fixedSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Sign In",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
