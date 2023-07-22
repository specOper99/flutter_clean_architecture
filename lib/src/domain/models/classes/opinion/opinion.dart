// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'opinion.freezed.dart';
part 'opinion.g.dart';

@freezed
class Opinion extends Equatable with _$Opinion {
  const Opinion._();

  factory Opinion({
    required int id,
    required String title,
    required String description,
    required String url,
    required String? urlToImage,
    required String publishedAt,
    required String content,
  }) = _Opinion;

  factory Opinion.fromJson(Map<String, Object?> json) =>
      _$OpinionFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
