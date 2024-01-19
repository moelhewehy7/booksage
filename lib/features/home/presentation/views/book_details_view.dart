import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/data/models/book_model/book_model.dart';

import '../manager/similar books cubit/similiar_books_cubit.dart';
import 'widgets/book_detailes_view_body.dart';

class BookDetailesView extends StatefulWidget {
  const BookDetailesView({super.key, required this.bookmodel});
  final BookModel bookmodel;
  @override
  State<BookDetailesView> createState() => _BookDetailesViewState();
}

class _BookDetailesViewState extends State<BookDetailesView> {
  @override
  void initState() {
    BlocProvider.of<SimiliarBooksCubit>(context).fetchSimiliarBooks(
      category: widget.bookmodel.volumeInfo.categories?[0] ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailesViewBody(
        bookModel: widget.bookmodel,
      ),
    );
  }
}
