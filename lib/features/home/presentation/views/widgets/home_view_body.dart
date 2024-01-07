import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reading/constants.dart';
import 'package:reading/core/utils/assets.dart';
import 'package:reading/core/utils/styles.dart';
import 'appbar.dart';
import 'bookslistview.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const CustomAppBar(),
        const SizedBox(
          height: 16,
        ),
        BooksListView(
          height: height,
          width: width,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Best Seller",
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 20,
              ),
              BestsellerlistViewItem(
                height: height,
                width: width,
              )
            ],
          ),
        )
      ],
    );
  }
}

class BestsellerlistViewItem extends StatelessWidget {
  const BestsellerlistViewItem(
      {super.key, required this.height, required this.width});
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width * 0.25,
            height: height * 0.3,
            decoration: BoxDecoration(
                color: kprimarycolor, borderRadius: BorderRadius.circular(6)),
            child: Image.asset(
              AssetsData.logo,
              scale: 12,
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Harry Potter book asdasdasd ",
                style: Styles.textStyle20,
              ),
              Text(
                "j.k. rowling ",
                style: Styles.textStyle14,
              ),
              Text(
                "harry potter book asdasdasd ",
                style: Styles.textStyle14,
              ),
              Row(
                children: [
                  Text("19.9"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
