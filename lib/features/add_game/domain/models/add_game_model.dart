import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_game_model.freezed.dart';
part 'add_game_model.g.dart';

@freezed
class AddGameModel with _$AddGameModel {
  const factory AddGameModel({
    final DateTime? date,
    final String? timer,
    final String? nameOpponent,
    final String? placeOfName,
    final String? note,
    final String? city,
    final String? id,
    @Default(false) bool isActive,
    @Default(false) bool isRedicActive,
  }) = _AddGameModel;

  factory AddGameModel.fromJson(Map<String, dynamic> json) => _$AddGameModelFromJson(json);
}