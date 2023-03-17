import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_x/res/routes/routes_name.dart';
import 'package:social_x/utils/utils.dart';

class AuthController extends GetxController {
  RxString authState = "login".obs;
  RxBool termAndCondition = false.obs;
  RxBool loading = false.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final phoneNoController = TextEditingController().obs;

  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signUp(BuildContext context) async {
    loading.value = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: emailController.value.text.toString(),
              password: passwordController.value.text.toString())
          .then((value) {
        Get.offAndToNamed(RouteName.homeView);
        loading.value = false;
        Utils.toastMessage("User Created Successfully");
      }).onError((error, stackTrace) {
        loading.value = false;
        Utils.toastMessage("user not created :- ${error.toString()}");
      });
    } catch (e) {
      loading.value = false;
      Utils.toastMessage("User not cretaed :- ${e.toString()}");
    }
  }

  void login(BuildContext context) async {
    loading.value = true;
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: emailController.value.text.toString(),
              password: passwordController.value.text.toString())
          .then((value) {
        Get.offAndToNamed(RouteName.homeView);
        loading.value = false;
        Utils.toastMessage("Login Successfuly :- ${value.toString()}");
      }).onError((error, stackTrace) {
        loading.value = false;
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      loading.value = false;
      Utils.toastMessage(e.toString());
    }
  }

  void setAuthState(value) {
    authState.value = value;
  }

  void setTermAndCOndition() {
    if (termAndCondition.value == false) {
      termAndCondition.value = true;
    } else {
      termAndCondition.value = false;
    }
  }

  logout() {
    _auth.signOut().then((value) {
      Get.offAllNamed(RouteName.authView);
      Utils.toastMessage("Loged out..");
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
