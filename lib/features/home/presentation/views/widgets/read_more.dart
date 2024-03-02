import 'package:flutter/material.dart';
import 'package:reading/core/utils/styles.dart';
import 'package:readmore/readmore.dart';

import '../../../../../constants.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      style: Styles.textStyle25
          .copyWith(fontWeight: FontWeight.w500, fontSize: 17),
      textAlign: TextAlign.justify,
      trimLines: 3,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Length,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      moreStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: kprimarycolor),
      lessStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: kprimarycolor),
    );
  }
}
