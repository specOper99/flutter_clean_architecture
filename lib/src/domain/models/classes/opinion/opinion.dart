// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/constants/strings.dart';

part 'opinion.freezed.dart';
part 'opinion.g.dart';

@freezed
@Entity(tableName: opinionsTableName)
class Opinion extends Equatable with _$Opinion {
  const Opinion._();

  factory Opinion({
    @JsonKey(includeFromJson: false, includeToJson: false)
    @PrimaryKey(autoGenerate: true)
    int? id,
    @JsonKey(name: 'id') required String? serverUUID,
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
      serverUUID,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
