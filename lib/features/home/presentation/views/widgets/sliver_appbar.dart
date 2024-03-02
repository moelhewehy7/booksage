import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reading/core/utils/app_router.dart';
import 'package:reading/core/utils/assets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        // prevent the SliverAppBar from changing its background color to a darker shade
        background: Container(
          color: Color(0xFFfffbfe),
        ),
      ),
      automaticallyImplyLeading: false,
      pinned: true,
      elevation: 0,
      title: Image.asset(
        AssetsData.bookSage,
        scale: 11,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.ksearchview);
          },
        )
      ],
    );
  }
}
