import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/favoriteMovies/view/favorite_movies_view.dart';
import 'package:movieapp/module/home/controllers/home_controller.dart';
import 'package:movieapp/shared/theme/colors.dart';

import '../../../profile/view/profile_view.dart';

class ContainerDrawer extends StatelessWidget {
  const ContainerDrawer(
      {super.key,
      required this.profilePicture,
      required this.username,
      required this.email,
      required this.password,
      required this.idToken});

  final String? profilePicture, username, email, password, idToken;

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    Map<dynamic, dynamic> drawerContentMap = {
      "Profile": Icons.person_outline,
      "Favorite Movies": Icons.favorite_outline,
      "Logout": Icons.logout,
    };
    return Column(
        children: drawerContentMap.entries
            .map(
              (e) => GestureDetector(
                onTap: () {
                  if (e.key == "Profile") {
                    Get.to(() => ProfileView(
                        profilePicture: profilePicture!,
                        username: username!,
                        email: email!,
                        password: password!,
                        idToken: idToken!));
                  } else if (e.key == "Logout") {
                    homeController.confirmLogout(context);
                  } else {
                    Get.to(() => const FavoriteMoviesView());
                  }
                },
                child: Container(
                    width: Get.size.width,
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.only(left: 20),
                    height: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: CustomColor.secondaryBgColor,
                                width: 1))),
                    child: Row(
                      children: [
                        Icon(
                          e.value,
                          color: CustomColor.secondaryBgColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          e.key,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w100),
                        )
                      ],
                    )),
              ),
            )
            .toList());
  }
}
