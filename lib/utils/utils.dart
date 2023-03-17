import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:social_x/res/colors/app_colors.dart';

class Utils {
  // function to change the focus from the current textfield to another with keyboard
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // toast message util
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.BOTTOM);
  }

  //snack bar with getX
  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }
}
