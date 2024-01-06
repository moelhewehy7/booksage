import 'package:flutter/material.dart';
import 'package:reading/features/home/presentation/views/widgets/customelistviewitem.dart';

import 'customappbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CustomAppBar(),
        CustomeListViewItem(width: width, height: height)
      ],
    );
  }
}
