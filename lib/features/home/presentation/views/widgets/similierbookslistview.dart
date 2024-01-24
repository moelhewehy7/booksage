import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/features/home/presentation/manager/similar%20books%20cubit/similiar_books_cubit.dart';
import '../../../../../core/utils/widgets/custom_error.dart';
import 'booklistviewitem.dart';
import 'shimmersimilierlistview.dart';

class SimilierBooksListView extends StatelessWidget {
  const SimilierBooksListView(
      {super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimiliarBooksCubit, SimiliarBooksState>(
      builder: (context, state) {
        if (state is SimiliarBooksSuccess) {
          return SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 15, right: 15),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  child: BookListViewItem(
                    height: height,
                    width: width * 0.2,
                    imageurl: " state.books[i]",
                  ),
                );
              },
            ),
          );
        } else if (state is SimiliarBooksFailure) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomError(errormessage: state.errMessage));
        } else {
          return ShimmerSimilierBookListView(
            height: height,
            width: width,
          );
        }
      },
    );
  }
}
