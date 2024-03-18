import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../animations/fade_in_slide.dart';
import '../../../../constants.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/styles.dart';
import 'widgets/button.dart';

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
            FadeInSlide(
              duration: .5,
              child: Text(
                "Let's Get Started!",
                style: Styles.textStyle20.copyWith(color: kprimarycolor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height * 0.015),
            FadeInSlide(
              duration: .6,
              child: Text(
                "Let's dive into some great books.",
                style: Styles.textStyle18.copyWith(color: kprimarycolor),
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
                  backgroundColor: const Color(0xFF5F433A),
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w500),
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
                  backgroundColor: const Color(0xFFFFDCD1),
                  fixedSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: kprimarycolor),
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
