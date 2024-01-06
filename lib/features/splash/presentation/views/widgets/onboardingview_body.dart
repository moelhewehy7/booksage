import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:reading/core/utils/assets.dart';
import 'package:reading/features/home/presentation/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: IntroductionScreen(
        pages: [
          CustomPageViewModel(
              title: "BookVerse Navigator",
              body:
                  'Navigate through an expansive universe of stories and knowledge. Explore diverse genres, from gripping tales to informative narratives, guiding you through an immersive journey of discovery and enlightenment',
              image: Image.asset(AssetsData.illustrationfirst)),
          CustomPageViewModel(
              title: "Pages & Paths Plaza",
              body:
                  'Wander through an interactive plaza of literary wonders. Engage with curated collections, discover new narratives, and forge your own path through the labyrinth of books, each page unveiling new adventures',
              image: Image.asset(AssetsData.illustrationsecond)),
          CustomPageViewModel(
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

  PageViewModel CustomPageViewModel({
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
    Get.off(() => HomeView());
  }
}


// Container(
//       height: size.height,
//       width: size.width,
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//         begin: Alignment.center,
//         end: Alignment.bottomCenter,
//         colors: [Color(0xFFFFFFFF), Color(0xFFFAF8F7)],
//       )),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: screenHeight * 0.001,
//           ),
//           SizedBox(height: 450, child: Image.asset(AssetsData.illustration)),
//           Container(
//             height: screenHeight * 0.25,
//             decoration: const BoxDecoration(
//               color: Color(0xff311c00),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(50),
//                 topRight: Radius.circular(50),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Discover New Worlds',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10.0),
//                   const Text(
//                     'Dive into captivating stories and explore endless adventures.',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                   const SizedBox(height: 20.0),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: ElevatedButton(
//                       onPressed: () async {},
//                       child: const Text('Start Reading'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         textStyle: const TextStyle(color: Color(0xff311c00)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     )