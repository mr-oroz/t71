// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_profile_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfilestate {
  UserProfileModel? get user => throw _privateConstructorUsedError;

  /// Create a copy of UserProfilestate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfilestateCopyWith<UserProfilestate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfilestateCopyWith<$Res> {
  factory $UserProfilestateCopyWith(
          UserProfilestate value, $Res Function(UserProfilestate) then) =
      _$UserProfilestateCopyWithImpl<$Res, UserProfilestate>;
  @useResult
  $Res call({UserProfileModel? user});

  $UserProfileModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserProfilestateCopyWithImpl<$Res, $Val extends UserProfilestate>
    implements $UserProfilestateCopyWith<$Res> {
  _$UserProfilestateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfilestate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ) as $Val);
  }

  /// Create a copy of UserProfilestate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserProfileModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfilestateImplCopyWith<$Res>
    implements $UserProfilestateCopyWith<$Res> {
  factory _$$UserProfilestateImplCopyWith(_$UserProfilestateImpl value,
          $Res Function(_$UserProfilestateImpl) then) =
      __$$UserProfilestateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileModel? user});

  @override
  $UserProfileModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserProfilestateImplCopyWithImpl<$Res>
    extends _$UserProfilestateCopyWithImpl<$Res, _$UserProfilestateImpl>
    implements _$$UserProfilestateImplCopyWith<$Res> {
  __$$UserProfilestateImplCopyWithImpl(_$UserProfilestateImpl _value,
      $Res Function(_$UserProfilestateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfilestate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$UserProfilestateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfileModel?,
    ));
  }
}

/// @nodoc

class _$UserProfilestateImpl implements _UserProfilestate {
  const _$UserProfilestateImpl({this.user});

  @override
  final UserProfileModel? user;

  @override
  String toString() {
    return 'UserProfilestate(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfilestateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of UserProfilestate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfilestateImplCopyWith<_$UserProfilestateImpl> get copyWith =>
      __$$UserProfilestateImplCopyWithImpl<_$UserProfilestateImpl>(
          this, _$identity);
}

abstract class _UserProfilestate implements UserProfilestate {
  const factory _UserProfilestate({final UserProfileModel? user}) =
      _$UserProfilestateImpl;

  @override
  UserProfileModel? get user;

  /// Create a copy of UserProfilestate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfilestateImplCopyWith<_$UserProfilestateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
