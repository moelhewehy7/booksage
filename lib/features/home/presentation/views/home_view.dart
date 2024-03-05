import 'package:booksage/core/utils/widgets/signout_alert_dialgo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/assets.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/utils/app_router.dart';
import '../../../auth/presentaion/cubit/auth_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          // prevent the SliverAppBar from changing its background color to a darker shade
          background: Container(
            color: const Color(0xFFfffbfe),
          ),
        ),
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
        iconTheme: const IconThemeData(color: kprimarycolor),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF4A342D),
        child: Column(children: [
          const DrawerHeader(
              child: CircleAvatar(
            radius: 60,
            child: Icon(IconlyLight.profile),
          )),
          MyListTile(
            icon: Icons.home,
            text: "Home",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          MyListTile(
            icon: Icons.search,
            text: "Search",
            ontap: () {
              GoRouter.of(context).push(AppRouter.ksearchview);
            },
          ),
          // MyListTile(
          //   icon: Icons.favorite,
          //   text: "Favourties",
          //   ontap: () {},
          // ),
          MyListTile(
            icon: Icons.person,
            text: "Profile",
            ontap: () {
              GoRouter.of(context).push(AppRouter.kEditProfile);
              BlocProvider.of<AuthCubit>(context).fetchUserData();
            },
          ),
          const Spacer(),
          MyListTile(
            icon: Icons.logout,
            text: "LogOut",
            ontap: () async {
              signoutAlertdialog(context);
            },
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
      body: const HomeViewBody(),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });
  final IconData icon;
  final void Function() ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: ontap,
        leading: Icon(icon, color: Colors.white, size: 25),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
