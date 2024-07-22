import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_training_model.freezed.dart';
part 'add_training_model.g.dart';

@freezed
class AddTrainingModel with _$AddTrainingModel {
  const factory AddTrainingModel({
    final DateTime? date,
    final String? timer,
    final String? nameCouch,
    final String? placeWorkout,
    final String? duration,
    final String? city,
    final String? id,
    final String? intensiry,
    final String? typeWorkout,
    final String? note,
  }) = _AddTrainingModel;

  factory AddTrainingModel.fromJson(Map<String, dynamic> json) => _$AddTrainingModelFromJson(json);
}