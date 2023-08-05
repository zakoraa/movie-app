import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/module/updateProfile/controller/update_profile_controller.dart';
import 'package:movieapp/shared/utils/scaffold_background_template.dart';
import 'package:movieapp/shared/widgets/button_widget.dart';
import 'package:movieapp/shared/widgets/textfield_widget.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateProfileController controller = Get.put(UpdateProfileController());
    return Scaffold(
      body: ScaffoldBackgroundTemplate(
        child: Center(
          child: SizedBox(
            height: Get.height,
            width: Get.width * 0.9,
            child: SafeArea(
                child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 35,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    const Text(
                      "Update Your Username",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFieldWidget(
                  loginSignup: false,
                  text: "Username",
                  icon: Icons.person,
                  controller: controller.username,
                  selectedController: controller,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonWidget(
                    fontSize: 16,
                    height: 50,
                    width: Get.width * 0.9,
                    onTap: () {},
                    controller: controller,
                    text: "Save")
              ],
            )),
          ),
        ),
      ),
    );
  }
}
