import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/widgets/bookmark_view.dart';
import 'package:news_app/app/modules/bookmark/controllers/bookmark_controller.dart';

class BookmarkScreen extends GetView<BookmarkController> {
  const BookmarkScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CupertinoActivityIndicator())
            : TransformerPageView(
                itemCount: controller.myFavourite!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return BookmarkView(
                      newsData: controller.myFavourite![index],
                      screenSize: MediaQuery.of(context).size);
                }),
      ),
    );
  }
}
