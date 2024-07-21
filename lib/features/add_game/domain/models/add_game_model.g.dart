// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddGameModelImpl _$$AddGameModelImplFromJson(Map<String, dynamic> json) =>
    _$AddGameModelImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      timer: json['timer'] as String?,
      nameOpponent: json['nameOpponent'] as String?,
      placeOfName: json['placeOfName'] as String?,
      note: json['note'] as String?,
      city: json['city'] as String?,
      id: json['id'] as String?,
      isActive: json['isActive'] as bool? ?? false,
      isRedicActive: json['isRedicActive'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddGameModelImplToJson(_$AddGameModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'timer': instance.timer,
      'nameOpponent': instance.nameOpponent,
      'placeOfName': instance.placeOfName,
      'note': instance.note,
      'city': instance.city,
      'id': instance.id,
      'isActive': instance.isActive,
      'isRedicActive': instance.isRedicActive,
    };
