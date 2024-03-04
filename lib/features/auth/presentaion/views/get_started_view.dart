import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reading/animations/fade_in_slide.dart';
import 'package:reading/constants.dart';
import 'package:reading/core/utils/app_router.dart';
import 'package:reading/core/utils/assets.dart';
import 'package:reading/features/auth/presentaion/views/widgets/button.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            FadeInSlide(
              duration: .4,
              child: SizedBox(
                  height: height * 0.15, child: Image.asset(AssetsData.logo)),
            ),
            const Spacer(),
            const FadeInSlide(
              duration: .5,
              child: Text(
                "Let's Get Started!",
                style: TextStyle(color: kprimarycolor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.015),
            const FadeInSlide(
              duration: .6,
              child: Text(
                "Let's dive in into your account",
                style: TextStyle(color: kprimarycolor),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: .7,
              child: LoginButton(
                icon: Brand(Brands.google, size: 25),
                text: "Continue with Google",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: .9,
              child: LoginButton(
                icon: Brand(Brands.facebook, size: 25),
                text: "Continue with Facebook",
                onPressed: () {},
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: 1.0,
              child: LoginButton(
                icon: Brand(Brands.twitterx, size: 25),
                text: "Continue with X",
                onPressed: () {},
              ),
            ),
            const Spacer(),
            FadeInSlide(
              duration: 1.1,
              child: FilledButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignup);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF7B574B),
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            FadeInSlide(
              duration: 1.2,
              child: FilledButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignin);
                },
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF7B574B),
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const FadeInSlide(
              duration: 1.0,
              direction: FadeSlideDirection.btt,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Privacy Policy"),
                  Text("   -   "),
                  Text("Terms of Service"),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
