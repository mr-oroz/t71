// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotesModelImpl _$$NotesModelImplFromJson(Map<String, dynamic> json) =>
    _$NotesModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      photo: _$JsonConverterFromJson<String, Uint8List>(
          json['photo'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$$NotesModelImplToJson(_$NotesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'photo': _$JsonConverterToJson<String, Uint8List>(
          instance.photo, const Uint8ListConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
