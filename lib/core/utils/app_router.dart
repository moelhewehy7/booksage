import 'package:go_router/go_router.dart';
import 'package:reading/features/onboarding/presentation/views/onboardingview.dart';
import 'package:reading/features/splash/presentation/views/splashview.dart';

import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kOnBoardingView = '/onbboardingView';
  static const kbookdetailesview = '/bookdetailesview';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kbookdetailesview,
        builder: (context, state) => const BookDetailesView(),
      )
    ],
  );
}
