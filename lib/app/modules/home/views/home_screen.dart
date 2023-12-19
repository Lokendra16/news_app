import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/widgets/custom_drawer.dart';
import 'package:news_app/app/common/widgets/custom_news_view.dart';
import 'package:news_app/app/modules/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      })),
      drawer: CustomDrawer(controller: controller),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(
                radius: 20,
              ))
            : TransformerPageView(
                itemCount: controller.newsData!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CustomNewsView(
                    homeController: controller,
                      newsData: controller.newsData![index],
                      screenSize: MediaQuery.of(context).size);
                }),
      ),
    );
  }
}

