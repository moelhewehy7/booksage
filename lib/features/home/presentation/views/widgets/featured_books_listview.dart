import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading/core/utils/widgets/custom_error.dart';
import 'package:reading/features/home/domain/entities/book_entity.dart';
import 'package:reading/features/home/presentation/views/widgets/shimmer_book_listviewitem.dart';
import '../../manager/Fetch feautred books cubit/featured_books_cubit.dart';
import 'fetch_featured_books_listview.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView(
      {super.key, required this.width, required this.height});
  final double width, height;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return FetchFeaturedBooksListView(
          height: widget.height,
          width: widget.width,
          books: state.books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Center(child: CustomError(errormessage: state.errMessage));
      } else {
        return SizedBox(
          height: widget.height * 0.25,
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 6, right: 10),
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 2, top: 6),
                child: ShimmerBookListViewItem(
                    width: widget.width * 0.3, height: widget.height * 0.25),
              );
            },
          ),
        );
      }
    });
  }
}



// with pagination
//class FeaturedBooksListView extends StatefulWidget {
//   const FeaturedBooksListView(
//       {super.key, required this.width, required this.height});
//   final double width, height;

//   @override
//   State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
// }

// class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
//   List<BookEntity> books = [];
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
//         listener: (context, state) {
//       if (state is FeaturedBooksSuccess) {
//         books.addAll(state.books);
//       } else if (state is FeaturedBooksPaginationFailure) {
//         final snackBar = SnackBar(
//           content: Text(state.errMessage),
//           duration: const Duration(seconds: 3), // Adjust the duration as needed
//         );

//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     }, builder: (context, state) {
//       if (state is FeaturedBooksSuccess ||
//           state is FeaturedBooksPaginationLoading ||
//           state is FeaturedBooksPaginationFailure) {
//         return FetchFeaturedBooksListView(
//           height: widget.height,
//           width: widget.width,
//           books: books ?? [books.first],
//         );
//       } else if (state is FeaturedBooksFailure) {
//         return Center(child: CustomError(errormessage: state.errMessage));
//       } else {
//         return SizedBox(
//           height: widget.height * 0.25,
//           child: ListView.builder(
//             padding: const EdgeInsets.only(left: 6, right: 10),
//             itemCount: 7,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (BuildContext context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 2, top: 6),
//                 child: ShimmerBookListViewItem(
//                     width: widget.width * 0.3, height: widget.height * 0.25),
//               );
//             },
//           ),
//         );
//       }
//     });
//   }
// }
