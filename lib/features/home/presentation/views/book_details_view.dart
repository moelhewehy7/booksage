import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';

import '../manager/similar books cubit/similiar_books_cubit.dart';
import 'widgets/book_detailes_view_body.dart';

class BookDetailesView extends StatefulWidget {
  const BookDetailesView({super.key, required this.bookentity});
  final BookEntity bookentity;
  @override
  State<BookDetailesView> createState() => _BookDetailesViewState();
}

class _BookDetailesViewState extends State<BookDetailesView> {
  @override
  void initState() {
    BlocProvider.of<SimiliarBooksCubit>(context).fetchSimiliarBooks(
      category: widget.bookentity.category ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailesViewBody(
        bookentity: widget.bookentity,
      ),
    );
  }
}
