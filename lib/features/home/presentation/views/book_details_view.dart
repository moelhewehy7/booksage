import 'package:flutter/material.dart';

import 'widgets/book_detailes_view_body.dart';

class BookDetailesView extends StatelessWidget {
  const BookDetailesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookDetailesViewBody(),
    );
  }
}
