// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_game_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddGameState {
  List<AddGameModel> get addGames => throw _privateConstructorUsedError;
  List<AddGameModel> get historyGames => throw _privateConstructorUsedError;
  List<AddGameModel> get filteredGames => throw _privateConstructorUsedError;
  List<AddGameModel> get filteredHistory => throw _privateConstructorUsedError;
  DateTime? get focusedDay => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  String get typeTimer => throw _privateConstructorUsedError;
  AddGameModel? get gameCard => throw _privateConstructorUsedError;

  /// Create a copy of AddGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddGameStateCopyWith<AddGameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddGameStateCopyWith<$Res> {
  factory $AddGameStateCopyWith(
          AddGameState value, $Res Function(AddGameState) then) =
      _$AddGameStateCopyWithImpl<$Res, AddGameState>;
  @useResult
  $Res call(
      {List<AddGameModel> addGames,
      List<AddGameModel> historyGames,
      List<AddGameModel> filteredGames,
      List<AddGameModel> filteredHistory,
      DateTime? focusedDay,
      int minute,
      int hour,
      String typeTimer,
      AddGameModel? gameCard});

  $AddGameModelCopyWith<$Res>? get gameCard;
}

/// @nodoc
class _$AddGameStateCopyWithImpl<$Res, $Val extends AddGameState>
    implements $AddGameStateCopyWith<$Res> {
  _$AddGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addGames = null,
    Object? historyGames = null,
    Object? filteredGames = null,
    Object? filteredHistory = null,
    Object? focusedDay = freezed,
    Object? minute = null,
    Object? hour = null,
    Object? typeTimer = null,
    Object? gameCard = freezed,
  }) {
    return _then(_value.copyWith(
      addGames: null == addGames
          ? _value.addGames
          : addGames // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
      historyGames: null == historyGames
          ? _value.historyGames
          : historyGames // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
      filteredGames: null == filteredGames
          ? _value.filteredGames
          : filteredGames // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
      filteredHistory: null == filteredHistory
          ? _value.filteredHistory
          : filteredHistory // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
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
      typeTimer: null == typeTimer
          ? _value.typeTimer
          : typeTimer // ignore: cast_nullable_to_non_nullable
              as String,
      gameCard: freezed == gameCard
          ? _value.gameCard
          : gameCard // ignore: cast_nullable_to_non_nullable
              as AddGameModel?,
    ) as $Val);
  }

  /// Create a copy of AddGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddGameModelCopyWith<$Res>? get gameCard {
    if (_value.gameCard == null) {
      return null;
    }

    return $AddGameModelCopyWith<$Res>(_value.gameCard!, (value) {
      return _then(_value.copyWith(gameCard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddGameStateImplCopyWith<$Res>
    implements $AddGameStateCopyWith<$Res> {
  factory _$$AddGameStateImplCopyWith(
          _$AddGameStateImpl value, $Res Function(_$AddGameStateImpl) then) =
      __$$AddGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AddGameModel> addGames,
      List<AddGameModel> historyGames,
      List<AddGameModel> filteredGames,
      List<AddGameModel> filteredHistory,
      DateTime? focusedDay,
      int minute,
      int hour,
      String typeTimer,
      AddGameModel? gameCard});

  @override
  $AddGameModelCopyWith<$Res>? get gameCard;
}

/// @nodoc
class __$$AddGameStateImplCopyWithImpl<$Res>
    extends _$AddGameStateCopyWithImpl<$Res, _$AddGameStateImpl>
    implements _$$AddGameStateImplCopyWith<$Res> {
  __$$AddGameStateImplCopyWithImpl(
      _$AddGameStateImpl _value, $Res Function(_$AddGameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addGames = null,
    Object? historyGames = null,
    Object? filteredGames = null,
    Object? filteredHistory = null,
    Object? focusedDay = freezed,
    Object? minute = null,
    Object? hour = null,
    Object? typeTimer = null,
    Object? gameCard = freezed,
  }) {
    return _then(_$AddGameStateImpl(
      addGames: null == addGames
          ? _value._addGames
          : addGames // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
      historyGames: null == historyGames
          ? _value._historyGames
          : historyGames // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
      filteredGames: null == filteredGames
          ? _value._filteredGames
          : filteredGames // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
      filteredHistory: null == filteredHistory
          ? _value._filteredHistory
          : filteredHistory // ignore: cast_nullable_to_non_nullable
              as List<AddGameModel>,
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
      typeTimer: null == typeTimer
          ? _value.typeTimer
          : typeTimer // ignore: cast_nullable_to_non_nullable
              as String,
      gameCard: freezed == gameCard
          ? _value.gameCard
          : gameCard // ignore: cast_nullable_to_non_nullable
              as AddGameModel?,
    ));
  }
}

/// @nodoc

class _$AddGameStateImpl implements _AddGameState {
  const _$AddGameStateImpl(
      {final List<AddGameModel> addGames = const [],
      final List<AddGameModel> historyGames = const [],
      final List<AddGameModel> filteredGames = const [],
      final List<AddGameModel> filteredHistory = const [],
      this.focusedDay,
      this.minute = 10,
      this.hour = 10,
      this.typeTimer = 'AM',
      this.gameCard})
      : _addGames = addGames,
        _historyGames = historyGames,
        _filteredGames = filteredGames,
        _filteredHistory = filteredHistory;

  final List<AddGameModel> _addGames;
  @override
  @JsonKey()
  List<AddGameModel> get addGames {
    if (_addGames is EqualUnmodifiableListView) return _addGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addGames);
  }

  final List<AddGameModel> _historyGames;
  @override
  @JsonKey()
  List<AddGameModel> get historyGames {
    if (_historyGames is EqualUnmodifiableListView) return _historyGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyGames);
  }

  final List<AddGameModel> _filteredGames;
  @override
  @JsonKey()
  List<AddGameModel> get filteredGames {
    if (_filteredGames is EqualUnmodifiableListView) return _filteredGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredGames);
  }

  final List<AddGameModel> _filteredHistory;
  @override
  @JsonKey()
  List<AddGameModel> get filteredHistory {
    if (_filteredHistory is EqualUnmodifiableListView) return _filteredHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredHistory);
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
  @JsonKey()
  final String typeTimer;
  @override
  final AddGameModel? gameCard;

  @override
  String toString() {
    return 'AddGameState(addGames: $addGames, historyGames: $historyGames, filteredGames: $filteredGames, filteredHistory: $filteredHistory, focusedDay: $focusedDay, minute: $minute, hour: $hour, typeTimer: $typeTimer, gameCard: $gameCard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddGameStateImpl &&
            const DeepCollectionEquality().equals(other._addGames, _addGames) &&
            const DeepCollectionEquality()
                .equals(other._historyGames, _historyGames) &&
            const DeepCollectionEquality()
                .equals(other._filteredGames, _filteredGames) &&
            const DeepCollectionEquality()
                .equals(other._filteredHistory, _filteredHistory) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.minute, minute) || other.minute == minute) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.typeTimer, typeTimer) ||
                other.typeTimer == typeTimer) &&
            (identical(other.gameCard, gameCard) ||
                other.gameCard == gameCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addGames),
      const DeepCollectionEquality().hash(_historyGames),
      const DeepCollectionEquality().hash(_filteredGames),
      const DeepCollectionEquality().hash(_filteredHistory),
      focusedDay,
      minute,
      hour,
      typeTimer,
      gameCard);

  /// Create a copy of AddGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddGameStateImplCopyWith<_$AddGameStateImpl> get copyWith =>
      __$$AddGameStateImplCopyWithImpl<_$AddGameStateImpl>(this, _$identity);
}

abstract class _AddGameState implements AddGameState {
  const factory _AddGameState(
      {final List<AddGameModel> addGames,
      final List<AddGameModel> historyGames,
      final List<AddGameModel> filteredGames,
      final List<AddGameModel> filteredHistory,
      final DateTime? focusedDay,
      final int minute,
      final int hour,
      final String typeTimer,
      final AddGameModel? gameCard}) = _$AddGameStateImpl;

  @override
  List<AddGameModel> get addGames;
  @override
  List<AddGameModel> get historyGames;
  @override
  List<AddGameModel> get filteredGames;
  @override
  List<AddGameModel> get filteredHistory;
  @override
  DateTime? get focusedDay;
  @override
  int get minute;
  @override
  int get hour;
  @override
  String get typeTimer;
  @override
  AddGameModel? get gameCard;

  /// Create a copy of AddGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddGameStateImplCopyWith<_$AddGameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
