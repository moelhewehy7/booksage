import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

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
          SizedBox(
            width: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Harry Potter book asdasdasd ",
                maxLines: 2,
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "J.K. Rowling ",
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "harry potter book asdasdasd ",
                style: Styles.textStyle14,
              ),
              SizedBox(
                height: 6,
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
