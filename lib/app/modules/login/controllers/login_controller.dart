import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/app_tags.dart';
import 'package:news_app/app/common/app_utils.dart';
import 'package:news_app/app/common/extension.dart';
import 'package:news_app/app/routes/app_routes.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void moveForward() {
    if (emailController.text.isEmpty) {
      AppUtils.errorSnackBar(message: AppTags.enterEmail);
    } else if (!emailController.text.isValidEmail()) {
      AppUtils.errorSnackBar(message: AppTags.incorrectEmail);
    } else if (mobileController.text.isEmpty) {
      AppUtils.errorSnackBar(message: AppTags.enterMobile);
    } else if (mobileController.text.length < 10) {
      AppUtils.errorSnackBar(message: AppTags.incorrectMobile);
    } else if (passwordController.text.isEmpty) {
      AppUtils.errorSnackBar(message: AppTags.enterPassword);
    } else if (passwordController.text.length < 8) {
      AppUtils.errorSnackBar(message: AppTags.shortPassword);
    } else {
      Get.toNamed(AppRoutes.home);
      AppUtils.successSnackBar(message: "Go to next screen");
    }
  }
}
