import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rating,
    required this.count,
  });

  final num rating;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xfffedb4d),
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text(
          "$rating",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Text(
          "{$count}",
          style: Styles.textStyle14.copyWith(color: const Color(0xff6b6a79)),
        )
      ],
    );
  }
}
