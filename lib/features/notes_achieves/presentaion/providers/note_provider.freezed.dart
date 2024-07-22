// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NodeState {
  List<NotesModel> get notes => throw _privateConstructorUsedError;

  /// Create a copy of NodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NodeStateCopyWith<NodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeStateCopyWith<$Res> {
  factory $NodeStateCopyWith(NodeState value, $Res Function(NodeState) then) =
      _$NodeStateCopyWithImpl<$Res, NodeState>;
  @useResult
  $Res call({List<NotesModel> notes});
}

/// @nodoc
class _$NodeStateCopyWithImpl<$Res, $Val extends NodeState>
    implements $NodeStateCopyWith<$Res> {
  _$NodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NotesModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodeStateImplCopyWith<$Res>
    implements $NodeStateCopyWith<$Res> {
  factory _$$NodeStateImplCopyWith(
          _$NodeStateImpl value, $Res Function(_$NodeStateImpl) then) =
      __$$NodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotesModel> notes});
}

/// @nodoc
class __$$NodeStateImplCopyWithImpl<$Res>
    extends _$NodeStateCopyWithImpl<$Res, _$NodeStateImpl>
    implements _$$NodeStateImplCopyWith<$Res> {
  __$$NodeStateImplCopyWithImpl(
      _$NodeStateImpl _value, $Res Function(_$NodeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$NodeStateImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<NotesModel>,
    ));
  }
}

/// @nodoc

class _$NodeStateImpl implements _NodeState {
  const _$NodeStateImpl({final List<NotesModel> notes = const []})
      : _notes = notes;

  final List<NotesModel> _notes;
  @override
  @JsonKey()
  List<NotesModel> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NodeState(notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodeStateImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  /// Create a copy of NodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NodeStateImplCopyWith<_$NodeStateImpl> get copyWith =>
      __$$NodeStateImplCopyWithImpl<_$NodeStateImpl>(this, _$identity);
}

abstract class _NodeState implements NodeState {
  const factory _NodeState({final List<NotesModel> notes}) = _$NodeStateImpl;

  @override
  List<NotesModel> get notes;

  /// Create a copy of NodeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NodeStateImplCopyWith<_$NodeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
