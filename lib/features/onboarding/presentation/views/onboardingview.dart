import '../../../home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../auth/presentaion/views/get_started_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/onboardingview_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  bool onboardingShown = true;
  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      onboardingShown = prefs.getBool('onboardingShown') ?? false;
    });
  }

// If there is no value stored in shared preferences for the key 'onboardingShown',
//onboardingShown is set to false  (indicating that the onboarding has not been shown yet)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: onboardingShown
            ? StreamBuilder(
                stream: FirebaseAuth.instance.userChanges(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return const HomeView();
                  } else {
                    return const GetStartedView();
                  }
                },
              )
            : const OnBoardingViewBody());
  }
}
// If onboardingShown is false, the OnBoardingViewBody widget is displayed.
// Otherwise, the HomeView widget is displayed..

