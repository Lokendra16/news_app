import 'package:get/get.dart';
import 'package:news_app/app/modules/bookmark/bindings/bookmark_binding.dart';
import 'package:news_app/app/modules/bookmark/views/bookmark_screen.dart';
import 'package:news_app/app/modules/home/bindings/home_binding.dart';
import 'package:news_app/app/modules/home/views/home_screen.dart';
import 'package:news_app/app/modules/login/bindings/login_binding.dart';
import 'package:news_app/app/modules/login/views/login_screen.dart';
import 'package:news_app/app/routes/app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.login;

  static final routes = [
    GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: AppRoutes.bookmark,
        page: () => const BookmarkScreen(),
        binding: BookmarkBinding())
  ];
}
