import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2C2C2C),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: Image.asset(
                "assets/Ellipse 3.png",
                scale: 0.3,
              )),
          Column(
            children: [
              DrawerHeader(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    height: 40,
                    width: Get.size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFB039),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                "https://pbs.twimg.com/media/FnQKQaWXoAADHK0.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Guinevere Beck",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
