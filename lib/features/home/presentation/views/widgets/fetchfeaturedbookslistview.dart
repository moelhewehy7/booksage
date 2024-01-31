import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reading/features/home/presentation/manager/Fetch%20feautred%20books%20cubit/featured_books_cubit.dart';
import 'package:reading/features/home/presentation/views/widgets/featuredbooklistviewitem.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';

class FetchFeaturedBooksListView extends StatefulWidget {
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
  State<StatefulWidget> createState() => _FetchFeaturedBooksListViewState();
}

class _FetchFeaturedBooksListViewState
    extends State<FetchFeaturedBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  bool isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    double currentPosition = _scrollController.position.pixels;
    double maxScroll = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScroll) {
      // Check if not currently loading to prevent redundant fetch requests
      if (isFetching == false) {
        isFetching = true;
        // Set loading to true before initiating the fetch
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchfeaturedBooks(pagenumber: nextPage++);
        // Always set loading to false, even in case of an error
        isFetching = false;
      }
    }
  }

// !isFetching is equivalent to isFetching == false.
// Both expressions check if the boolean variable isloading is false.

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height * 0.25,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.only(left: 6, right: 10),
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.only(left: 2, top: 6),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kbookdetailesview, extra: widget.books[i]);
              },
              child: FeaturedBookListViewItem(
                width: widget.width * 0.3,
                height: widget.height * 0.25,
                imageurl: widget.books[i].image ?? " ",
              ),
            ),
          );
        },
      ),
    );
  }
}
