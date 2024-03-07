import 'package:booksage/core/utils/widgets/signout_alert_dialgo.dart';
import 'package:booksage/features/auth/presentaion/cubit/user_data_cubit/cubit/user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:booksage/constants.dart';
import 'package:booksage/core/utils/assets.dart';
import 'package:iconly/iconly.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../core/utils/app_router.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      drawer: SidebarX(
        animationDuration: Durations.short4,
        theme: const SidebarXTheme(
            selectedIconTheme: IconThemeData(color: kprimarycolor),
            selectedItemPadding:
                EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            selectedItemTextPadding: EdgeInsets.only(left: 10),
            itemPadding:
                EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
            itemTextPadding: EdgeInsets.only(left: 10),
            textStyle: TextStyle(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
            decoration: BoxDecoration(color: kbuttoncolor)),
        headerDivider: const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
        footerItems: [
          SidebarXItem(
            icon: IconlyLight.logout,
            label: "Logout",
            onTap: () async {
              signoutdialog(context);
            },
          )
        ],
        footerDivider: const Divider(
          color: Colors.white,
          height: 1,
        ),
        headerBuilder: (context, extemded) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/default_avatar.jpg"),
              backgroundColor: Color(0xFFFFE8CB),
              radius: 40,
            ),
          );
        },
        extendedTheme: SidebarXTheme(
            selectedIconTheme: const IconThemeData(color: kprimarycolor),
            selectedTextStyle: const TextStyle(color: kprimarycolor),
            selectedItemDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 235, 221),
                borderRadius: BorderRadius.circular(8)),
            textStyle: const TextStyle(color: Colors.white),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: kbuttoncolor,
            ),
            hoverColor: kbuttoncolor,
            padding: const EdgeInsets.only(
              top: 20,
            ),
            width: size.width * .50),
        controller: SidebarXController(
          selectedIndex: 0,
        ),
        items: [
          SidebarXItem(
            icon: IconlyLight.home,
            label: "Home",
            onTap: () {
              GoRouter.of(context).pop();
            },
          ),
          SidebarXItem(
            icon: IconlyLight.search,
            label: "Search",
            onTap: () {
              GoRouter.of(context).push(AppRouter.ksearchview);
            },
          ),
          SidebarXItem(
            icon: IconlyLight.profile,
            label: "Profile",
            onTap: () {
              BlocProvider.of<UserDataCubit>(context).fetchUserData();
              GoRouter.of(context).push(AppRouter.kEditProfile);
            },
          ),
        ],
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
