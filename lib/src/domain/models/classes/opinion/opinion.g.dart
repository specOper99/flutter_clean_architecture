// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opinion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Opinion _$$_OpinionFromJson(Map<String, dynamic> json) => _$_Opinion(
      serverUUID: json['id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$_OpinionToJson(_$_Opinion instance) =>
    <String, dynamic>{
      'id': instance.serverUUID,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
