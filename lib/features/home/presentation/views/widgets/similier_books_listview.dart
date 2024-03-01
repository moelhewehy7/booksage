import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reading/core/utils/app_router.dart';
import 'package:reading/features/home/presentation/manager/similar%20books%20cubit/similiar_books_cubit.dart';
import '../../../../../core/utils/widgets/custom_error.dart';
import 'featured_book_listview_item.dart';
import 'shimmer_similier_listview.dart';

class SimilierBooksListView extends StatelessWidget {
  const SimilierBooksListView(
      {super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimiliarBooksCubit, SimiliarBooksState>(
      builder: (context, state) {
        if (state is SimiliarBooksSuccess) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              height: height * 0.20,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .push(AppRouter.ksimilarview, extra: state.books[i]);
                    },
                    child: FeaturedBookListViewItem(
                      height: height,
                      width: width * 0.25,
                      imageurl: state.books[i].image ?? "",
                    ),
                  );
                },
              ),
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
