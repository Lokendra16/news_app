import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/app_tags.dart';
import 'package:news_app/app/common/widgets/custom_field.dart';
import 'package:news_app/app/modules/login/controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          children: [
            Text(
              AppTags.loginScreen,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),

            /// EMAIL TEXT FORM FIELD
            CustomField(
                onChanged: (value) {},
                controller: controller.emailController,
                hintText: AppTags.email,
                textInputType: TextInputType.emailAddress),

            /// MOBILE TEXT FORM FIELD
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CustomField(
                  onChanged: (val) {},
                  maxLength: 10,
                  controller: controller.mobileController,
                  hintText: AppTags.mobile,
                  textInputType: TextInputType.number),
            ),

            /// PASSWORD TEXT FORM FIELD
            CustomField(
                onChanged: (val) {},
                controller: controller.passwordController,
                hintText: AppTags.password,
                textInputType: TextInputType.visiblePassword),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {
                          controller.moveForward();
                        },
                        child: const Text(
                          AppTags.signIn,
                          style: TextStyle(color: Colors.white),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
