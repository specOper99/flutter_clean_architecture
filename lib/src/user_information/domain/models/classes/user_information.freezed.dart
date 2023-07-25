// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_information.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) {
  return _UserInformation.fromJson(json);
}

/// @nodoc
mixin _$UserInformation {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  int get starsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInformationCopyWith<UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInformationCopyWith<$Res> {
  factory $UserInformationCopyWith(
          UserInformation value, $Res Function(UserInformation) then) =
      _$UserInformationCopyWithImpl<$Res, UserInformation>;
  @useResult
  $Res call({String id, String username, int starsCount});
}

/// @nodoc
class _$UserInformationCopyWithImpl<$Res, $Val extends UserInformation>
    implements $UserInformationCopyWith<$Res> {
  _$UserInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? starsCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      starsCount: null == starsCount
          ? _value.starsCount
          : starsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInformationCopyWith<$Res>
    implements $UserInformationCopyWith<$Res> {
  factory _$$_UserInformationCopyWith(
          _$_UserInformation value, $Res Function(_$_UserInformation) then) =
      __$$_UserInformationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String username, int starsCount});
}

/// @nodoc
class __$$_UserInformationCopyWithImpl<$Res>
    extends _$UserInformationCopyWithImpl<$Res, _$_UserInformation>
    implements _$$_UserInformationCopyWith<$Res> {
  __$$_UserInformationCopyWithImpl(
      _$_UserInformation _value, $Res Function(_$_UserInformation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? starsCount = null,
  }) {
    return _then(_$_UserInformation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      starsCount: null == starsCount
          ? _value.starsCount
          : starsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInformation extends _UserInformation {
  _$_UserInformation(
      {required this.id, required this.username, required this.starsCount})
      : super._();

  factory _$_UserInformation.fromJson(Map<String, dynamic> json) =>
      _$$_UserInformationFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final int starsCount;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInformationCopyWith<_$_UserInformation> get copyWith =>
      __$$_UserInformationCopyWithImpl<_$_UserInformation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInformationToJson(
      this,
    );
  }
}

abstract class _UserInformation extends UserInformation {
  factory _UserInformation(
      {required final String id,
      required final String username,
      required final int starsCount}) = _$_UserInformation;
  _UserInformation._() : super._();

  factory _UserInformation.fromJson(Map<String, dynamic> json) =
      _$_UserInformation.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  int get starsCount;
  @override
  @JsonKey(ignore: true)
  _$$_UserInformationCopyWith<_$_UserInformation> get copyWith =>
      throw _privateConstructorUsedError;
}
