import 'package:flutter/material.dart';
import 'package:reading/constants.dart';
import 'package:reading/core/utils/styles.dart';

import '../../../../../core/utils/custombutton.dart';
import 'bookrating.dart';
import 'custom_appbar.dart';

class BookDetailesViewBody extends StatelessWidget {
  const BookDetailesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppBar(),
          SizedBox(
            height: 16,
          ),
          Text(
            "The Jungle Book",
            style: Styles.textStyle25,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Text(
              "By Rudyard Kipling",
              style: Styles.textStyle16,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          BookRating(),
          SizedBox(
            height: 16,
          ),
          Container(
            height: height * .50,
            width: width * .90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.brown),
          ),
          SizedBox(
            height: 15,
          ),
          BoxActionButton(),
        ],
      ),
    );
  }
}

class BoxActionButton extends StatelessWidget {
  const BoxActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            string: '19.9€',
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            onPressed: () {},
            color: Color.fromARGB(255, 255, 229, 220),
            textcolor: kprimarycolor,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        Expanded(
          child: CustomButton(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            string: 'Free Preview',
            onPressed: () {},
            color: Color.fromARGB(255, 123, 87, 75),
            textcolor: Colors.white,
            fontSize: 18,
            letterSpacing: 0.1,
          ),
        )
      ],
    );
  }
}
