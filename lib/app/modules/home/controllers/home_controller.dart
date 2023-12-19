import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_app/app/common/app_tags.dart';
import 'package:news_app/app/common/app_utils.dart';
import 'package:news_app/app/common/database/database_repository.dart';
import 'package:news_app/app/networking/api_client.dart';
import 'package:news_app/app/networking/models/favourite/favourite.dart';
import 'package:news_app/app/networking/models/news_response/news_response.dart';

class HomeController extends GetxController {
  List<String> menuItem = [
    AppTags.all,
    AppTags.national,
    AppTags.business,
    AppTags.sports,
    AppTags.world,
    AppTags.politics,
    AppTags.technology,
    AppTags.startUp,
    AppTags.entertainment,
    AppTags.misc,
    AppTags.hatke,
    AppTags.science,
    AppTags.automobile,
    AppTags.bookmark
  ];

  List<Data>? newsData = <Data>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getNewsApi(AppTags.national.toLowerCase());
    super.onInit();
  }


  /// GET NEWS API
  void getNewsApi(String id) async {
    isLoading.value = true;
    try {
      debugPrint("id : $id");
      final client = ApiClient();
      var response = await client.getNews(id.toLowerCase());
      if (response.success == true) {
        newsData = response.data;
        isLoading.value = false;
      } else {
        AppUtils.errorSnackBar(message: "Something went wrong!");
        isLoading.value = false;
      }
    } catch (e) {
      AppUtils.errorSnackBar(message: "$e");
      isLoading.value = false;
    }
  }

  /// ADD TO BOOKMARK
  void bookmarkNews(Data newsData) async {
    Favourite favourite = Favourite(
        title: newsData.title!,
        content: newsData.content!,
        imageUrl: newsData.imageUrl!,
        isImportant: false);
    await DatabaseRepository.instance.insert(favourite: favourite);
    //Get.back(result: "1");
    AppUtils.successSnackBar(message: "Success");
  }



}
