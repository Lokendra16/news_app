import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/database/database_repository.dart';
import 'package:news_app/app/networking/models/favourite/favourite.dart';

class BookmarkController extends GetxController {
  List<Favourite>? myFavourite = <Favourite>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    initDb();
    super.onInit();
  }

  /// INITIALIZING THE DATABASE
  void initDb() async {
    await DatabaseRepository.instance.database;
    getBookmarkNews();
  }

  /// GET BOOKMARK NEWS
  void getBookmarkNews() async {
    isLoading.value = true;
    await DatabaseRepository.instance.getAllTodos().then((value) {
      myFavourite = value;
      isLoading.value = false;
    }).catchError((e) => debugPrint(e));
  }
}
