import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  String? category;
  List<Data>? data;
  bool? success;

  NewsResponse(
      {required this.category, required this.data, required this.success});

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}

@JsonSerializable()
class Data {
  String? author;
  String? content;
  String? date;
  String? id;
  String? imageUrl;
  String? readMoreUrl;
  String? time;
  String? title;
  String? url;

  Data(
      {required this.author,
      required this.id,
      required this.title,
      required this.time,
      required this.content,
      required this.date,
      required this.imageUrl,
      required this.readMoreUrl,
      required this.url});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
