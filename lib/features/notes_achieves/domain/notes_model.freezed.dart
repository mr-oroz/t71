// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotesModel _$NotesModelFromJson(Map<String, dynamic> json) {
  return _NotesModel.fromJson(json);
}

/// @nodoc
mixin _$NotesModel {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get photo => throw _privateConstructorUsedError;

  /// Serializes this NotesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotesModelCopyWith<NotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesModelCopyWith<$Res> {
  factory $NotesModelCopyWith(
          NotesModel value, $Res Function(NotesModel) then) =
      _$NotesModelCopyWithImpl<$Res, NotesModel>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      @Uint8ListConverter() Uint8List? photo});
}

/// @nodoc
class _$NotesModelCopyWithImpl<$Res, $Val extends NotesModel>
    implements $NotesModelCopyWith<$Res> {
  _$NotesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotesModelImplCopyWith<$Res>
    implements $NotesModelCopyWith<$Res> {
  factory _$$NotesModelImplCopyWith(
          _$NotesModelImpl value, $Res Function(_$NotesModelImpl) then) =
      __$$NotesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? description,
      @Uint8ListConverter() Uint8List? photo});
}

/// @nodoc
class __$$NotesModelImplCopyWithImpl<$Res>
    extends _$NotesModelCopyWithImpl<$Res, _$NotesModelImpl>
    implements _$$NotesModelImplCopyWith<$Res> {
  __$$NotesModelImplCopyWithImpl(
      _$NotesModelImpl _value, $Res Function(_$NotesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$NotesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotesModelImpl implements _NotesModel {
  const _$NotesModelImpl(
      {this.id,
      this.title,
      this.description,
      @Uint8ListConverter() this.photo});

  factory _$NotesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotesModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @Uint8ListConverter()
  final Uint8List? photo;

  @override
  String toString() {
    return 'NotesModel(id: $id, title: $title, description: $description, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.photo, photo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      const DeepCollectionEquality().hash(photo));

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotesModelImplCopyWith<_$NotesModelImpl> get copyWith =>
      __$$NotesModelImplCopyWithImpl<_$NotesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotesModelImplToJson(
      this,
    );
  }
}

abstract class _NotesModel implements NotesModel {
  const factory _NotesModel(
      {final String? id,
      final String? title,
      final String? description,
      @Uint8ListConverter() final Uint8List? photo}) = _$NotesModelImpl;

  factory _NotesModel.fromJson(Map<String, dynamic> json) =
      _$NotesModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @Uint8ListConverter()
  Uint8List? get photo;

  /// Create a copy of NotesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotesModelImplCopyWith<_$NotesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
