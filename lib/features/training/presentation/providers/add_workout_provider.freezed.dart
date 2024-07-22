// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_workout_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddWorkoutState {
  List<AddTrainingModel> get workouts => throw _privateConstructorUsedError;
  DateTime? get focusedDay => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;

  /// Create a copy of AddWorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddWorkoutStateCopyWith<AddWorkoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddWorkoutStateCopyWith<$Res> {
  factory $AddWorkoutStateCopyWith(
          AddWorkoutState value, $Res Function(AddWorkoutState) then) =
      _$AddWorkoutStateCopyWithImpl<$Res, AddWorkoutState>;
  @useResult
  $Res call(
      {List<AddTrainingModel> workouts,
      DateTime? focusedDay,
      int minute,
      int hour});
}

/// @nodoc
class _$AddWorkoutStateCopyWithImpl<$Res, $Val extends AddWorkoutState>
    implements $AddWorkoutStateCopyWith<$Res> {
  _$AddWorkoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddWorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
    Object? focusedDay = freezed,
    Object? minute = null,
    Object? hour = null,
  }) {
    return _then(_value.copyWith(
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<AddTrainingModel>,
      focusedDay: freezed == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddWorkoutStateImplCopyWith<$Res>
    implements $AddWorkoutStateCopyWith<$Res> {
  factory _$$AddWorkoutStateImplCopyWith(_$AddWorkoutStateImpl value,
          $Res Function(_$AddWorkoutStateImpl) then) =
      __$$AddWorkoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AddTrainingModel> workouts,
      DateTime? focusedDay,
      int minute,
      int hour});
}

/// @nodoc
class __$$AddWorkoutStateImplCopyWithImpl<$Res>
    extends _$AddWorkoutStateCopyWithImpl<$Res, _$AddWorkoutStateImpl>
    implements _$$AddWorkoutStateImplCopyWith<$Res> {
  __$$AddWorkoutStateImplCopyWithImpl(
      _$AddWorkoutStateImpl _value, $Res Function(_$AddWorkoutStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddWorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workouts = null,
    Object? focusedDay = freezed,
    Object? minute = null,
    Object? hour = null,
  }) {
    return _then(_$AddWorkoutStateImpl(
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<AddTrainingModel>,
      focusedDay: freezed == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddWorkoutStateImpl implements _AddWorkoutState {
  const _$AddWorkoutStateImpl(
      {final List<AddTrainingModel> workouts = const [],
      this.focusedDay,
      this.minute = 10,
      this.hour = 10})
      : _workouts = workouts;

  final List<AddTrainingModel> _workouts;
  @override
  @JsonKey()
  List<AddTrainingModel> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  final DateTime? focusedDay;
  @override
  @JsonKey()
  final int minute;
  @override
  @JsonKey()
  final int hour;

  @override
  String toString() {
    return 'AddWorkoutState(workouts: $workouts, focusedDay: $focusedDay, minute: $minute, hour: $hour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddWorkoutStateImpl &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.hour, hour) || other.hour == hour));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_workouts), focusedDay, minute, hour);

  /// Create a copy of AddWorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddWorkoutStateImplCopyWith<_$AddWorkoutStateImpl> get copyWith =>
      __$$AddWorkoutStateImplCopyWithImpl<_$AddWorkoutStateImpl>(
          this, _$identity);
}

abstract class _AddWorkoutState implements AddWorkoutState {
  const factory _AddWorkoutState(
      {final List<AddTrainingModel> workouts,
      final DateTime? focusedDay,
      final int minute,
      final int hour}) = _$AddWorkoutStateImpl;

  @override
  List<AddTrainingModel> get workouts;
  @override
  DateTime? get focusedDay;
  @override
  int get minute;
  @override
  int get hour;

  /// Create a copy of AddWorkoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddWorkoutStateImplCopyWith<_$AddWorkoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
