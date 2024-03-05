import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:booksage/features/home/presentation/views/widgets/featured_book_listview_item.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';

class FetchFeaturedBooksListView extends StatelessWidget {
  const FetchFeaturedBooksListView({
    super.key,
    required this.height,
    required this.width,
    required this.books,
  });

  final double height;
  final double width;
  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.25,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 6, right: 6),
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kbookdetailesview, extra: books[i]);
            },
            child: FeaturedBookListViewItem(
              width: width * 0.31,
              height: height * 0.25,
              imageurl: books[i].image ?? " ",
            ),
          );
        },
      ),
    );
  }
}

//with pagination
// class FetchFeaturedBooksListView extends StatefulWidget {
//   const FetchFeaturedBooksListView({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.books,
//   });

//   final double height;
//   final double width;
//   final List<BookEntity> books;

//   @override
//   State<StatefulWidget> createState() => _FetchFeaturedBooksListViewState();
// }

// class _FetchFeaturedBooksListViewState
//     extends State<FetchFeaturedBooksListView> {
//   late final ScrollController _scrollController;
//   var nextPage = 1;
//   var isFetching = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//   }

//   void _scrollListener() async {
//     double currentPosition = _scrollController.position.pixels;
//     double maxScroll = _scrollController.position.maxScrollExtent;

//     if (currentPosition >= 0.7 * maxScroll) {
//       // Check if not currently loading to prevent redundant fetch requests
//       if (!isFetching) {
//         isFetching = true;
//         // Set loading to true before initiating the fetch
//         await BlocProvider.of<FeaturedBooksCubit>(context)
//             .fetchfeaturedBooks(pagenumber: nextPage++);
//         // Always set loading to false, even in case of an error
//         isFetching = false;
//       }
//     }
//   }

// // !isFetching is equivalent to isFetching == false. it means isFetching = false ? so condition is true
// // Both expressions check if the boolean variable isloading is false.
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: widget.height * 0.25,
//       child: ListView.builder(
//         controller: _scrollController,
//         padding: const EdgeInsets.only(left: 6, right: 10),
//         itemCount: widget.books.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (BuildContext context, int i) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 2, top: 6),
//             child: GestureDetector(
//               onTap: () {
//                 GoRouter.of(context)
//                     .push(AppRouter.kbookdetailesview, extra: widget.books[i]);
//               },
//               child: FeaturedBookListViewItem(
//                 width: widget.width * 0.3,
//                 height: widget.height * 0.25,
//                 imageurl: widget.books[i].image ?? " ",
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }