import 'package:flutter/material.dart';
import 'package:reading/features/home/presentation/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/onboardingview_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late bool onboardingShown = false;
  @override
  void initState() {
    super.initState();
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Update state to trigger rebuild
      onboardingShown = prefs.getBool('onboardingShown') ?? true;
    });
  }

// It uses SharedPreferences to retrieve a boolean value (onboardingShown)
// stored in the device's persistent storage (like local storage) using SharedPreferences.getInstance().
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: onboardingShown ? const OnBoardingViewBody() : const HomeView());
  }
}
