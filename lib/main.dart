import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/views/onboardingview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Reading());
}

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: OnBoardingView(),
    );
  }
}
