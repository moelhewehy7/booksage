import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:reading/core/utils/app_router.dart';
import 'package:reading/core/utils/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: IntroductionScreen(
        pages: [
          customPageViewModel(
              title: "BookVerse Navigator",
              body:
                  'Navigate through an expansive universe of stories and knowledge. Explore diverse genres, from gripping tales to informative narratives, guiding you through an immersive journey of discovery and enlightenment',
              image: Image.asset(AssetsData.illustrationfirst)),
          customPageViewModel(
              title: "Pages & Paths Plaza",
              body:
                  'Wander through an interactive plaza of literary wonders. Engage with curated collections, discover new narratives, and forge your own path through the labyrinth of books, each page unveiling new adventures',
              image: Image.asset(AssetsData.illustrationsecond)),
          customPageViewModel(
              title: "Reading Spires Haven",
              body:
                  'Ascend to the haven of knowledge and imagination. From classics to contemporary tales, immerse yourself in a sanctuary offering literary refuge and endless realms of thought-provoking narratives and contemplation',
              image: Image.asset(AssetsData.illustrationthird))
        ],
        globalBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        dotsContainerDecorator: const ShapeDecoration(
          color: kprimarycolor, // Replace with your desired color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size(10.0, 10.0),
            activeSize: const Size(22.0, 10.0),
            color: const Color(0xFFFFFFFF),
            activeColor: const Color.fromARGB(255, 255, 189, 104),
            activeShape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(25.0), // Adjust the radius as needed
            )),
        showDoneButton: true,
        done: const Text(
          "Start",
          style: TextStyle(color: Color(0xFFFFF5EB), fontSize: 16),
        ),
        showNextButton: true,
        next: const Icon(Icons.keyboard_arrow_right_outlined,
            color: Color(0xFFFFF5EB)),
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(color: Color(0xFFFFF5EB), fontSize: 16),
        ),
        onDone: () => onDone(context),
      ),
    );
  }

  PageViewModel customPageViewModel({
    required String title,
    required String body,
    required Image image,
  }) {
    return PageViewModel(
        title: title,
        body: body,
        image: image,
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 25, fontWeight: FontWeight.bold)));
  }

  void onDone(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingShown', false);

    GoRouter.of(context).push(AppRouter.kHomeView);
  }
}
