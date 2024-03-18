import '../../features/auth/presentaion/views/forgot_password.dart';
import '../../features/auth/presentaion/views/edit_profile.dart';
import '../../features/splash/presentation/views/splashview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'service_locator.dart';
import '../../features/auth/presentaion/views/get_started_view.dart';
import '../../features/auth/presentaion/views/sign_in_view.dart';
import '../../features/auth/presentaion/views/sign_up_view.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/domain/entities/book_entity.dart';
import '../../features/home/domain/use_cases/fetch_similar_books_usecase.dart';
import '../../features/home/domain/use_cases/fetch_by_search_usecase.dart';
import '../../features/search/presentaion/manager/search%20cubit/search_cubit.dart';
import '../../features/home/presentation/views/similar_books_view.dart';
import '../../features/onboarding/presentation/views/onboardingview.dart';
import '../../features/search/presentaion/views/search_view.dart';
import '../../features/home/presentation/manager/similar books cubit/similiar_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kOnBoardingView = '/onbboardingView';
  static const kbookdetailesview = '/bookdetailesview';
  static const ksearchview = '/searchview';
  static const ksimilarview = '/similarview';
  static const kGetStartedView = '/getstartedview';
  static const kSignin = '/signin';
  static const kSignup = '/signup';
  static const kForgotPassword = '/forgotpassword';
  static const kEditProfile = '/editprofile';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
          path: kOnBoardingView,
          builder: (context, state) => const OnBoardingView()),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kbookdetailesview,
        builder: (context, state) => BlocProvider(
          create: (context) => SimiliarBooksCubit(
            FetchSimilarBooksUseCase(getIt.get<HomeRepoImpel>()),
          ),
          child: BookDetailesView(
            bookentity: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: ksearchview,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            FetchBySearchUseCase(getIt.get<HomeRepoImpel>()),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: ksimilarview,
        builder: (context, state) =>
            SimilarBooksView(bookEntity: state.extra as BookEntity),
      ),
      GoRoute(
        path: kGetStartedView,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: kSignin,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: SignInView()),
      ),
      GoRoute(
        path: kSignup,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: SignUpView()),
      ),
      GoRoute(
        path: kForgotPassword,
        pageBuilder: (context, state) =>
            const CupertinoPage(child: ForgotPasswordView()),
      ),
      GoRoute(
        path: kEditProfile,
        builder: (context, state) => const EditProfile(),
      )
    ],
  );
}
// pageBuilder used to animate the transition between screens.