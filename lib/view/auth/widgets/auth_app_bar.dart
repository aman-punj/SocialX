import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_x/res/colors/app_colors.dart';
import 'package:social_x/view/auth/controller/auth_controller.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Container(
      height: Get.height * 0.18122,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: AppColor.primaryColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.06,
              left: Get.width * 0.04,
            ),
            child: Row(
              children: const [
                Text(
                  "Social",
                  style: TextStyle(
                      color: AppColor.wightColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "X",
                  style: TextStyle(
                      color: AppColor.wightColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Get.width * 0.01,
              right: Get.width * 0.01,
            ),
            child: Container(
              height: Get.height * 0.07,
              decoration: const BoxDecoration(
                  color: AppColor.wightColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                        onTap: () => authController.setAuthState("login"),
                        child: Obx((() {
                          return Container(
                            width: Get.width,
                            height: Get.height,
                            decoration: BoxDecoration(
                                color: authController.authState.value == "login"
                                    ? AppColor.primaryColor
                                    : AppColor.wightColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                )),
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: AppColor.secondaryTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }))),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () => authController.setAuthState("signup"),
                        child: Obx((() {
                          return Container(
                            width: Get.width,
                            height: Get.height,
                            decoration: BoxDecoration(
                                color:
                                    authController.authState.value == "signup"
                                        ? AppColor.primaryColor
                                        : AppColor.wightColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                )),
                            child: Center(
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                    color: AppColor.secondaryTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
