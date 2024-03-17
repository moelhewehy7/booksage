// ignore_for_file: use_build_context_synchronously

import 'package:booksage/core/utils/widgets/signout_alert_dialgo.dart';
import 'package:booksage/features/auth/presentaion/cubit/user_data_cubit/cubit/user_data_cubit.dart';
import 'package:extended_image/extended_image.dart';
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
      drawer: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserDataSuccess) {
            Map<String, dynamic>? userData = state.userData;
            return SidebarX(
              animationDuration: Durations.short4,
              theme: const SidebarXTheme(
                  selectedTextStyle: TextStyle(color: kprimarycolor),
                  width: 115,
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFf1f2f3),
                    radius: 45, // Increase the radius to make the avatar larger
                    child: ClipOval(
                      child: ExtendedImage.network(
                        userData?["photoUrl"],
                        width: 90, // Set the width as needed
                        height: 90, // Set the height as needed
                        fit: BoxFit.cover,
                        loadStateChanged: (ExtendedImageState state) {
                          switch (state.extendedImageLoadState) {
                            case LoadState.completed:
                              return state.completedWidget;
                            case LoadState.failed:
                              return const Icon(Icons.error);
                            case LoadState.loading:
                              return const Center(
                                child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: kprimarycolor,
                                    )),
                              );
                          }
                        },
                      ),
                    ),
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
                  onTap: () async {
                    await BlocProvider.of<UserDataCubit>(context).getUserData();
                    GoRouter.of(context).push(AppRouter.kEditProfile);
                  },
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      body: const HomeViewBody(),
    );
  }
}

// class MyListTile extends StatelessWidget {
//   const MyListTile({
//     super.key,
//     required this.icon,
//     required this.text,
//     required this.ontap,
//   });
//   final IconData icon;
//   final void Function() ontap;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: ListTile(
//         onTap: ontap,
//         leading: Icon(icon, color: Colors.white, size: 25),
//         title: Text(
//           text,
//           style: const TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }
