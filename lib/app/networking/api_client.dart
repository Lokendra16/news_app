import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/app/networking/apis.dart';
import 'package:news_app/app/networking/app_interceptor.dart';
import 'package:news_app/app/networking/models/news_response/news_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://inshortsapi.vercel.app")
abstract class ApiClient {
  factory ApiClient() {
    Dio dio = Dio(BaseOptions(
      contentType: "application/json",
    ));
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 30000),
        connectTimeout: const Duration(milliseconds: 30000));

    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return _ApiClient(dio);
  }

  @GET(Apis.news)
  Future<NewsResponse> getNews(@Query("category") String categoryId);
}
