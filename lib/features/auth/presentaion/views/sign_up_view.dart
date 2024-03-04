import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:reading/animations/fade_in_slide.dart';
import 'package:reading/features/auth/presentaion/views/widgets/button.dart';
import 'package:reading/features/auth/presentaion/views/widgets/textfields.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool termsAccepted = false;

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
            duration: .3,
            child: Text(
              "Join Smartome Today 👤",
            ),
          ),
          const SizedBox(height: 15),
          const FadeInSlide(
            duration: .4,
            child: Text(
              "Join Smartome, Your Gateway to Smart Living.",
            ),
          ),
          const SizedBox(height: 25),
          const FadeInSlide(
            duration: .5,
            child: Text(
              "Email",
            ),
          ),
          const SizedBox(height: 10),
          const FadeInSlide(
            duration: .5,
            child: EmailField(),
          ),
          const SizedBox(height: 20),
          const FadeInSlide(
            duration: .6,
            child: Text(
              "Password",
            ),
          ),
          const SizedBox(height: 10),
          const FadeInSlide(
            duration: .6,
            child: PasswordField(),
          ),
          const SizedBox(height: 20),
          // FadeInSlide(
          //   duration: .7,
          //   child: CheckboxListTile(
          //     controlAffinity: ListTileControlAffinity.leading,
          //     title: Text('Accept Terms and Conditions'),
          //     value: termsAccepted,
          //     onChanged: (newValue) {
          //       termsAccepted = newValue ?? false;
          //       setState(() {});
          //     },
          //   ),
          // ),
          const SizedBox(height: 20),
          FadeInSlide(
            duration: .8,
            child: Container(),
          ),
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
          SizedBox(height: height * 0.07),
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
      // persistentFooterAlignment: AlignmentDirectional.center,
      bottomNavigationBar: FadeInSlide(
        duration: 1,
        direction: FadeSlideDirection.btt,
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 30),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: .2, color: Colors.white),
            ),
          ),
          child: FilledButton(
            onPressed: () async {},
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF7B574B),
              fixedSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
