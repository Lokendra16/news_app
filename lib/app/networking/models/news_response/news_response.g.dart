// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) => NewsResponse(
      category: json['category'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$NewsResponseToJson(NewsResponse instance) =>
    <String, dynamic>{
      'category': instance.category,
      'data': instance.data,
      'success': instance.success,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      author: json['author'] as String?,
      id: json['id'] as String?,
      title: json['title'] as String?,
      time: json['time'] as String?,
      content: json['content'] as String?,
      date: json['date'] as String?,
      imageUrl: json['imageUrl'] as String?,
      readMoreUrl: json['readMoreUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'date': instance.date,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'readMoreUrl': instance.readMoreUrl,
      'time': instance.time,
      'title': instance.title,
      'url': instance.url,
    };
