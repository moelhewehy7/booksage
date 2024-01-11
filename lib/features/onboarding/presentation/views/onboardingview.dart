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
      onboardingShown = prefs.getBool('onboardingShown') ?? true;
    });
  }

// If prefs.getBool('onboardingShown') returns null, onboardingShown will be assigned true.
// Otherwise, it will be assigned the value retrieved from prefs.getBool('onboardingShown').
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: onboardingShown ? const OnBoardingViewBody() : const HomeView());
  }
}
// If onboardingShown is initially false, it will display the onboarding screen (OnBoardingViewBody()).
// If onboardingShown is initially true, it will directly navigate to HomeView().
// When onDone is executed, regardless of the initial value,
// it will update the value in SharedPreferences to false and navigate to HomeView().
