import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'bookrating.dart';

class BestsellerlistViewItem extends StatelessWidget {
  const BestsellerlistViewItem(
      {super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.20,
            height: height * 0.16,
            decoration: BoxDecoration(
                color: kprimarycolor, borderRadius: BorderRadius.circular(6)),
            child: Image.asset(
              AssetsData.logo,
              scale: 9,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("19.9€",
                        style: GoogleFonts.getFont('Roboto',
                            textStyle: Styles.textStyle20)),
                    const BookRating()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}