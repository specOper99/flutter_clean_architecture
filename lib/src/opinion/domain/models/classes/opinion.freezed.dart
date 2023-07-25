// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opinion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Opinion _$OpinionFromJson(Map<String, dynamic> json) {
  return _Opinion.fromJson(json);
}

/// @nodoc
mixin _$Opinion {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;
  String get publishedAt => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpinionCopyWith<Opinion> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpinionCopyWith<$Res> {
  factory $OpinionCopyWith(Opinion value, $Res Function(Opinion) then) =
      _$OpinionCopyWithImpl<$Res, Opinion>;
  @useResult
  $Res call(
      {String? id,
      String title,
      String description,
      String url,
      String? urlToImage,
      String publishedAt,
      String content});
}

/// @nodoc
class _$OpinionCopyWithImpl<$Res, $Val extends Opinion>
    implements $OpinionCopyWith<$Res> {
  _$OpinionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? urlToImage = freezed,
    Object? publishedAt = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpinionCopyWith<$Res> implements $OpinionCopyWith<$Res> {
  factory _$$_OpinionCopyWith(
          _$_Opinion value, $Res Function(_$_Opinion) then) =
      __$$_OpinionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      String description,
      String url,
      String? urlToImage,
      String publishedAt,
      String content});
}

/// @nodoc
class __$$_OpinionCopyWithImpl<$Res>
    extends _$OpinionCopyWithImpl<$Res, _$_Opinion>
    implements _$$_OpinionCopyWith<$Res> {
  __$$_OpinionCopyWithImpl(_$_Opinion _value, $Res Function(_$_Opinion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? url = null,
    Object? urlToImage = freezed,
    Object? publishedAt = null,
    Object? content = null,
  }) {
    return _then(_$_Opinion(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      urlToImage: freezed == urlToImage
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Opinion extends _Opinion {
  _$_Opinion(
      {required this.id,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content})
      : super._();

  factory _$_Opinion.fromJson(Map<String, dynamic> json) =>
      _$$_OpinionFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String url;
  @override
  final String? urlToImage;
  @override
  final String publishedAt;
  @override
  final String content;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpinionCopyWith<_$_Opinion> get copyWith =>
      __$$_OpinionCopyWithImpl<_$_Opinion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpinionToJson(
      this,
    );
  }
}

abstract class _Opinion extends Opinion {
  factory _Opinion(
      {required final String? id,
      required final String title,
      required final String description,
      required final String url,
      required final String? urlToImage,
      required final String publishedAt,
      required final String content}) = _$_Opinion;
  _Opinion._() : super._();

  factory _Opinion.fromJson(Map<String, dynamic> json) = _$_Opinion.fromJson;

  @override
  String? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get url;
  @override
  String? get urlToImage;
  @override
  String get publishedAt;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_OpinionCopyWith<_$_Opinion> get copyWith =>
      throw _privateConstructorUsedError;
}
