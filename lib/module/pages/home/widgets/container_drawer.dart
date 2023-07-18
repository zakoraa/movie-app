import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/routes/route_name.dart';

class ContainerDrawer extends StatelessWidget {
  const ContainerDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> drawerContentMap = {
      "Favorite Movies": Icons.favorite_outline,
      "Settings": Icons.settings,
      "Logout": Icons.logout,
    };
    return Column(
        children: drawerContentMap.entries
            .map(
              (e) => GestureDetector(
                onTap: () {
                  if (e.key == "Logout") {
                    Get.offAllNamed(RouteName.loginView);
                  }
                },
                child: Container(
                    width: Get.size.width,
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.only(left: 20),
                    height: 50,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.amber, width: 1))),
                    child: Row(
                      children: [
                        Icon(
                          e.value,
                          color: Colors.amber,
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
