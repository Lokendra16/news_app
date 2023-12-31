import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppUtils{
  static void successSnackBar({String title = 'Success', String? message}) {
    Get.log("[$title] $message");
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(title.tr,
            style: Get.textTheme.headline6!
                .merge(const TextStyle(color: Colors.white))),
        messageText: Text(message!,
            style: Get.textTheme.caption!
                .merge(const TextStyle(color: Colors.white))),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.green,
        icon: const Icon(Icons.check_circle_outline,
            size: 32, color: Colors.white),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        borderRadius: 8,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  static void errorSnackBar({String title = 'Error', String? message}) {
    Get.log("[$title] $message", isError: true);
    Get.showSnackbar(GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6!
              .merge(const TextStyle(color: Colors.white))),
      messageText: Text(message!.substring(0, min(message.length, 200)),
          style: Get.textTheme.caption!
              .merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.remove_circle_outline,
          size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 1),
    ));
  }
}