import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/app_tags.dart';
import 'package:news_app/app/modules/bookmark/views/bookmark_screen.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';
import 'package:news_app/app/routes/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: controller.menuItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 16.0, 16, 8),
            child: GestureDetector(
                onTap: () {
                  if (controller.menuItem[index] == 'Bookmark') {
                    Navigator.pop(context);
                    Get.toNamed(AppRoutes.bookmark);
                  } else {
                    Get.back();
                    controller.getNewsApi(controller.menuItem[index]);
                  }
                },
                child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text(controller.menuItem[index])))),
          );
        },
      ),
    );
  }
}
