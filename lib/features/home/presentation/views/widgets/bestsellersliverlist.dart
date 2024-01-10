import 'package:flutter/widgets.dart';

import 'bestsellerlistviewitem.dart';

class BestSellerSliverList extends StatelessWidget {
  const BestSellerSliverList(
      {super.key, required this.height, required this.width});
  final double height, width;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      //This approach ensures that only the visible items are rendered
      (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: BestSellerSliverListItem(height: height, width: width),
        );
      },
      childCount: 20,
    ));
  }
}
