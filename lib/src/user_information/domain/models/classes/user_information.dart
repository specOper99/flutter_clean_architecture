// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information.freezed.dart';
part 'user_information.g.dart';

@freezed
class UserInformation extends Equatable with _$UserInformation {
  const UserInformation._();

  factory UserInformation({
    required String id,
    required String username,
    required int starsCount,
    // required String description,
    // required String url,
    // required String? urlToImage,
    // required String publishedAt,
    // required String content,
  }) = _UserInformation;

  factory UserInformation.fromJson(Map<String, Object?> json) =>
      _$UserInformationFromJson(json);

  @override
  List<Object?> get props {
    return [
      id,
      username,
      starsCount,
    ];
  }
}
