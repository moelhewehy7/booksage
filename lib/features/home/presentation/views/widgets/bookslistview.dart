import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/core/utils/widgets/custom_error.dart';
import 'package:reading/features/home/presentation/manager/books%20cubit/books_cubit.dart';
import 'package:reading/features/home/presentation/views/widgets/shimmerbooklistviewitem.dart';

import 'booklistviewitem.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key, required this.width, required this.height});
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(builder: (context, state) {
      if (state is BooksSuccess) {
        return SizedBox(
          height: height * 0.3,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 6, right: 10),
            itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: const EdgeInsets.only(left: 2, top: 6),
                child: BookListViewItem(
                  width: width * 0.35,
                  height: height * 0.3,
                  imageurl:
                      state.books[i].volumeInfo.imageLinks?.thumbnail ?? "",
                ),
              );
            },
          ),
        );
      } else if (state is BooksFailure) {
        return Center(child: CustomError(errormessage: state.errMessage));
      } else {
        return SizedBox(
          height: height * 0.3,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 6, right: 10),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 2, top: 6),
                child: ShimmerBookListViewItem(
                    width: width * 0.35, height: height * 0.3),
              );
            },
          ),
        );
      }
    });
  }
}
