import 'package:flutter/material.dart';
import 'package:reading/core/utils/assets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetsData.bookSage,
              scale: 9,
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 28,
              ),
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
