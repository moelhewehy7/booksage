import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_router.dart';

void main() async {
  runApp(const Reading());
}

class Reading extends StatelessWidget {
  const Reading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light()
          .copyWith(textTheme: GoogleFonts.robotoSlabTextTheme()),
      // ignore: prefer_const_constructors
    );
  }
}
