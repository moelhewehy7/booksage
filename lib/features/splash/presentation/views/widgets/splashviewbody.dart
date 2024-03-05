import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  //This class manages the animation.
  //  It defines the duration, curve, and controls the status of the animation (like playing, stopping, repeating, etc.).
  late Animation<double> fadeAnimation;
  //  This class defines how a value changes over time.
  //  It represents the animation values that change from one value to another within a specified duration.

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    navigatetoonboarding();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  //  the dispose() method is used to release resources, like animation controllers,
  //  when a widget is removed from the screen. It prevents memory leaks and ensures proper cleanup

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(),
      child: Center(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white, Colors.white,

              Color(0xFFBAB1A6), // Ending color
            ],
            // Set gradient stops
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.logo,
                scale: 4,
              ),
              const SizedBox(
                height: 5,
              ),
              AnimatedBuilder(
                  animation: fadeAnimation,
                  builder: (BuildContext context, Widget? child) {
                    return Opacity(
                      opacity: fadeAnimation.value,
                      child: Image.asset(
                        AssetsData.bookSage,
                        scale: 12,
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void initFadeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);
    animationController.forward();
  }

  void navigatetoonboarding() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).pushReplacement(AppRouter.kOnBoardingView);
    });
  }
}
// Get.to(() => const OnBoardingView(),
//     transition: Transition.fadeIn,
//     duration: const Duration(milliseconds: 800));
