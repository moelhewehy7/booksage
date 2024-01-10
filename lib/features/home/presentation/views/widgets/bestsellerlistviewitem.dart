import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reading/core/utils/app_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'bookrating.dart';

class BestSellerSliverListItem extends StatelessWidget {
  const BestSellerSliverListItem(
      {super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kbookdetailesview);
      },
      child: SizedBox(
        height: height * 0.16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: width * 0.20,
              height: height * 0.16,
              decoration: BoxDecoration(
                  color: kprimarycolor, borderRadius: BorderRadius.circular(6)),
              child: Image.asset(
                AssetsData.logo,
                scale: 8,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Harry Potter book a afas fass dfs ffsdasdasd ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Styles.textStyle20,
                  ),
                  const Text(
                    "J.K. Rowling ",
                    style: Styles.textStyle14,
                  ),
                  Row(
                    children: [
                      Text("19.9€",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.robotoSlab(
                              textStyle: Styles.textStyle20
                                  .copyWith(letterSpacing: 1.3))),
                      const Spacer(
                        flex: 1,
                      ),
                      const BookRating()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
