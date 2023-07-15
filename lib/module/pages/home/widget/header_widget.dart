import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_profile_picture.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: SizedBox(
        width: Get.size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() => Scaffold.of(context).openDrawer()),
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
                const Icon(
                  Icons.search,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hi Guinevere Beck,",
                      style: TextStyle(),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "See Whats new Today",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                          fontSize: 14),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () => Get.to(()=>DetailProfilePicture()),
                  child: Hero(
                    tag :"imageTag",
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            "https://pbs.twimg.com/media/FnQKQaWXoAADHK0.jpg",
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
