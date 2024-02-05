import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reading/core/utils/service_locator.dart';
import 'package:reading/features/home/data/repos/home_repo_impl.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/domain/use_cases/fetchSimilarBooks_usecase.dart';
import 'package:reading/features/home/domain/use_cases/fetchbysearch_usecase.dart';
import 'package:reading/features/home/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:reading/features/home/presentation/views/SimilarbooksView.dart';
import 'package:reading/features/onboarding/presentation/views/onboardingview.dart';
import 'package:reading/features/search/presentaion/views/search_view.dart';
import 'package:reading/features/splash/presentation/views/splashview.dart';

import '../../features/home/presentation/manager/similar books cubit/similiar_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kOnBoardingView = '/onbboardingView';
  static const kbookdetailesview = '/bookdetailesview';
  static const ksearchview = '/searchview';
  static const ksimilarview = '/similarview';
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
      )
    ],
  );
}
