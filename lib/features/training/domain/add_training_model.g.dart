// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddTrainingModelImpl _$$AddTrainingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AddTrainingModelImpl(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      timer: json['timer'] as String?,
      nameCouch: json['nameCouch'] as String?,
      placeWorkout: json['placeWorkout'] as String?,
      duration: json['duration'] as String?,
      city: json['city'] as String?,
      id: json['id'] as String?,
      intensiry: json['intensiry'] as String?,
      typeWorkout: json['typeWorkout'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$AddTrainingModelImplToJson(
        _$AddTrainingModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'timer': instance.timer,
      'nameCouch': instance.nameCouch,
      'placeWorkout': instance.placeWorkout,
      'duration': instance.duration,
      'city': instance.city,
      'id': instance.id,
      'intensiry': instance.intensiry,
      'typeWorkout': instance.typeWorkout,
      'note': instance.note,
    };
