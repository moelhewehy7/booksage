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
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          // prevent the SliverAppBar from changing its background color to a darker shade
          background: Container(
            color: const Color(0xFFfffbfe),
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.zero, // Adjust padding as needed
                  child: Icon(Icons.keyboard_backspace, size: 30),
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle cart button press
                },
                child: const Padding(
                  padding: EdgeInsets.zero, // Adjust padding as needed
                  child: Icon(Icons.shopping_cart, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BookDetailesViewBody(
        bookentity: widget.bookentity,
      ),
    );
  }
}
