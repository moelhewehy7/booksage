import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reading/core/utils/service_locator.dart';
import 'package:reading/features/home/data/repos/home_repo_impl.dart';
import 'package:reading/features/home/presentation/manager/books%20cubit/books_cubit.dart';
import 'package:reading/features/home/presentation/manager/newest%20books%20cubit/newest_books_cubit.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'features/home/domain/entities/book_entity.dart';

void main() async {
  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeautredbox);
  runApp(const Reading());
}

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BooksCubit(getIt.get<HomeRepoImpel>())..fetchBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpel>())..fetchnewestBooks(),
        ),
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
