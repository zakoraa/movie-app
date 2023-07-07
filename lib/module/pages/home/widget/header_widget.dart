import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              children: const [
                Icon(
                  Icons.menu,
                  size: 30,
                ),
                Icon(
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
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.network(
                        "https://media.glamourmagazine.co.uk/photos/6138c811a35312eec27858a3/4:3/w_2080,h_1560,c_limit/gettyimages-1027343558_sf.jpg",
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
