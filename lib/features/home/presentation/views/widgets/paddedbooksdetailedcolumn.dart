import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:reading/features/home/presentation/views/widgets/bookrating.dart';
import 'package:reading/features/home/presentation/views/widgets/booksactionbutton.dart';
import 'package:reading/features/home/presentation/views/widgets/custom_appbar.dart';

class PaddedBooksDetailedColumn extends StatelessWidget {
  const PaddedBooksDetailedColumn({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppBar(
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "The Jungle Book",
            style: Styles.textStyle25,
          ),
          const SizedBox(
            height: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              "By Rudyard Kipling",
              style: Styles.textStyle16,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          const BookRating(),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: height * .50,
            width: width * .90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.brown),
          ),
          const SizedBox(
            height: 15,
          ),
          const BooksActionButton(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "You can also like",
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
