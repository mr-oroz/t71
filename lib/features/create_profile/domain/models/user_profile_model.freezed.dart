// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  String? get uuid => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get photo => throw _privateConstructorUsedError;
  String? get favoriteBeats => throw _privateConstructorUsedError;
  String? get gameLevel => throw _privateConstructorUsedError;

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call(
      {String? uuid,
      String? username,
      String? age,
      @Uint8ListConverter() Uint8List? photo,
      String? favoriteBeats,
      String? gameLevel});
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? username = freezed,
    Object? age = freezed,
    Object? photo = freezed,
    Object? favoriteBeats = freezed,
    Object? gameLevel = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      favoriteBeats: freezed == favoriteBeats
          ? _value.favoriteBeats
          : favoriteBeats // ignore: cast_nullable_to_non_nullable
              as String?,
      gameLevel: freezed == gameLevel
          ? _value.gameLevel
          : gameLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      String? username,
      String? age,
      @Uint8ListConverter() Uint8List? photo,
      String? favoriteBeats,
      String? gameLevel});
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? username = freezed,
    Object? age = freezed,
    Object? photo = freezed,
    Object? favoriteBeats = freezed,
    Object? gameLevel = freezed,
  }) {
    return _then(_$UserProfileModelImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      favoriteBeats: freezed == favoriteBeats
          ? _value.favoriteBeats
          : favoriteBeats // ignore: cast_nullable_to_non_nullable
              as String?,
      gameLevel: freezed == gameLevel
          ? _value.gameLevel
          : gameLevel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  const _$UserProfileModelImpl(
      {this.uuid,
      this.username,
      this.age,
      @Uint8ListConverter() this.photo,
      this.favoriteBeats,
      this.gameLevel});

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final String? uuid;
  @override
  final String? username;
  @override
  final String? age;
  @override
  @Uint8ListConverter()
  final Uint8List? photo;
  @override
  final String? favoriteBeats;
  @override
  final String? gameLevel;

  @override
  String toString() {
    return 'UserProfileModel(uuid: $uuid, username: $username, age: $age, photo: $photo, favoriteBeats: $favoriteBeats, gameLevel: $gameLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.age, age) || other.age == age) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            (identical(other.favoriteBeats, favoriteBeats) ||
                other.favoriteBeats == favoriteBeats) &&
            (identical(other.gameLevel, gameLevel) ||
                other.gameLevel == gameLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, username, age,
      const DeepCollectionEquality().hash(photo), favoriteBeats, gameLevel);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  const factory _UserProfileModel(
      {final String? uuid,
      final String? username,
      final String? age,
      @Uint8ListConverter() final Uint8List? photo,
      final String? favoriteBeats,
      final String? gameLevel}) = _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  String? get uuid;
  @override
  String? get username;
  @override
  String? get age;
  @override
  @Uint8ListConverter()
  Uint8List? get photo;
  @override
  String? get favoriteBeats;
  @override
  String? get gameLevel;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
