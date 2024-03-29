import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../domain/entities/book_entity.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BestSellerSliverListItem extends StatelessWidget {
  const BestSellerSliverListItem({
    super.key,
    required this.height,
    required this.width,
    required this.bookenitity,
  });
  final double height, width;
  final BookEntity bookenitity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kbookdetailesview, extra: bookenitity);
      },
      child: SizedBox(
        height: height * 0.16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 8,
              shadowColor: Colors.brown,
              margin: const EdgeInsets.all(5),
              child: Container(
                height: height * 0.16,
                padding: EdgeInsets.zero,
                width: width * 0.22,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 232, 232, 232),
                    borderRadius: BorderRadius.circular(6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: ExtendedImage.network(
                    alignment: Alignment.center,
                    bookenitity.image ?? "",
                    fit: BoxFit.fill,
                    cache: true,
                    loadStateChanged: (ExtendedImageState state) {
                      switch (state.extendedImageLoadState) {
                        case LoadState.completed:
                          return state.completedWidget;
                        case LoadState.failed:
                          return const Icon(Icons.error);
                        case LoadState.loading:
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bookenitity.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Styles.textStyle18,
                    ),
                    Text(bookenitity.authorName ?? "Author not available",
                        style: Styles.textStyle14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                    Row(
                      children: [
                        Text("Free",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.robotoSlab(
                                textStyle:
                                    Styles.textStyle20.copyWith(fontSize: 16))),
                        const BookRating(
                          rating: 0,
                          count: 0,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
