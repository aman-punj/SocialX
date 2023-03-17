import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_x/res/colors/app_colors.dart';
import 'package:social_x/view/auth/controller/auth_controller.dart';

class AuthBottomBar extends StatelessWidget {
  const AuthBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return BottomAppBar(
      color: Colors.grey,
      child: InkWell(
        onTap: authController.authState.value == "login"
            ? (() {})
            : (() => authController.signUp(context)),
        child: Container(
            height: Get.height * 0.08,
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: Obx((() {
              return Center(
                child: Text(
                  authController.authState.value == "login"
                      ? "LOGIN"
                      : "REGISTER",
                  style: TextStyle(
                      color: AppColor.secondaryTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              );
            }))),
      ),
    );
  }
}
