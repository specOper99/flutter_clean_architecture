// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInformation _$$_UserInformationFromJson(Map<String, dynamic> json) =>
    _$_UserInformation(
      id: json['id'] as String,
      username: json['username'] as String,
      starsCount: json['starsCount'] as int,
    );

Map<String, dynamic> _$$_UserInformationToJson(_$_UserInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'starsCount': instance.starsCount,
    };
