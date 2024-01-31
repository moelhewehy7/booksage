import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reading/core/utils/service_locator.dart';
import 'package:reading/core/utils/simple_boc_obserer.dart';
import 'package:reading/features/home/data/repos/home_repo_impl.dart';
import 'package:reading/features/home/domain/use_cases/fetchfeaturedbooks_usecase.dart';
import 'package:reading/features/home/domain/use_cases/fetchnewstbooks_usecase.dart';
import 'package:reading/features/home/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'features/home/domain/entities/book_entity.dart';
import 'features/home/presentation/manager/Fetch feautred books cubit/featured_books_cubit.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeautredbox);
  await Hive.openBox<BookEntity>(kNewestbox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Reading());
}

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpel>()))
            ..fetchfeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
              FetchNewestBooksUseCase(getIt.get<HomeRepoImpel>()))
            ..fetchnewestBooks(),
        ),
        //  the cascade operator (..) in Dart. It's used to perform a sequence of operations on the same object.
        //  It's typically used to make a series of calls on the same object without repeating the object reference.
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(textTheme: GoogleFonts.robotoSlabTextTheme()),
        // ignore: prefer_const_constructors
      ),
    );
  }
}
