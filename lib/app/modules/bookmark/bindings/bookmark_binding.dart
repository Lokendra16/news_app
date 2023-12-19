import 'package:get/get.dart';
import 'package:news_app/app/modules/bookmark/controllers/bookmark_controller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookmarkController());
  }
}
