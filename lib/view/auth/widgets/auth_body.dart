import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_x/res/colors/app_colors.dart';
import 'package:social_x/utils/utils.dart';
import 'package:social_x/view/auth/controller/auth_controller.dart';

class AuthBody extends StatelessWidget {
  AuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(
                top: Get.height * 0.014, bottom: Get.height * 0.014),
            child: Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                    color: AppColor.wightColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Obx((() {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.02,
                          bottom: Get.height * 0.02,
                          left: Get.height * 0.05,
                          right: Get.height * 0.05),
                      child: authController.authState.value == "login"
                          ? LoginBody(authController: authController)
                          : SignUpBody(authController: authController));
                })))));
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: authController.signUpFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            AuthBodyHeading(
              heading: "Create an",
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              "Name",
              style: TextStyle(
                  fontSize: 17,
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              controller: authController.nameController.value,
              hintText: "John Doe",
              icon: (Icons.person),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              "Email",
              style: TextStyle(
                  fontSize: 17,
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              controller: authController.emailController.value,
              hintText: "johndoe@gmail.com",
              icon: (Icons.mail),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 17,
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
                controller: authController.passwordController.value,
                hintText: "password",
                icon: (Icons.lock_outline)),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx((() {
                  return Checkbox(
                      activeColor: AppColor.primaryColor,
                      value: authController.termAndCondition.value,
                      onChanged: ((value) {
                        authController.setTermAndCOndition();
                      }));
                })),
                Text(
                  "I agree with ",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColor.secondaryTextColor,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "term & condition",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ? ",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColor.secondaryTextColor,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () => authController.setAuthState("login"),
                  child: const Text(
                    "Sign In!",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: authController.signInFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            AuthBodyHeading(
              heading: "SignIn into your",
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              "Email",
              style: TextStyle(
                  fontSize: 17,
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              controller: authController.emailController.value,
              hintText: "johndoe@gmail.com",
              icon: (Icons.mail),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 17,
                  color: AppColor.primaryTextColor,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
                controller: authController.passwordController.value,
                hintText: "password",
                icon: (Icons.lock_outline)),
            SizedBox(
              height: Get.height * 0.01,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                    fontSize: 15,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Login with",
                style: TextStyle(
                    fontSize: 15,
                    color: AppColor.primaryTextColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: Get.height * 0.013,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.network(
                        "https://img.freepik.com/free-icon/google_318-278809.jpg")),
                SizedBox(
                  width: Get.width * 0.1,
                ),
                SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/124/124010.png"))
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ? ",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColor.secondaryTextColor,
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () => authController.setAuthState("signup"),
                  child: const Text(
                    "Register Now",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  IconData icon;
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
            color: AppColor.primaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: AppColor.secondaryTextColor)),
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("error", "This field is required");
        }
        return null;
      },
    );
  }
}

class AuthBodyHeading extends StatelessWidget {
  String? heading;
  AuthBodyHeading({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading.toString(),
          style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 27,
              fontWeight: FontWeight.w700),
        ),
        const Text(
          "Account",
          style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 28,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
