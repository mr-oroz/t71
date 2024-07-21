// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      uuid: json['uuid'] as String?,
      username: json['username'] as String?,
      age: json['age'] as String?,
      photo: _$JsonConverterFromJson<String, Uint8List>(
          json['photo'], const Uint8ListConverter().fromJson),
      favoriteBeats: json['favoriteBeats'] as String?,
      gameLevel: json['gameLevel'] as String?,
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'username': instance.username,
      'age': instance.age,
      'photo': _$JsonConverterToJson<String, Uint8List>(
          instance.photo, const Uint8ListConverter().toJson),
      'favoriteBeats': instance.favoriteBeats,
      'gameLevel': instance.gameLevel,
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
