import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:t71/features/create_profile/domain/models/user_profile_model.dart';

part 'notes_model.freezed.dart';
part 'notes_model.g.dart';

@freezed
class NotesModel with _$NotesModel {
  const factory NotesModel({
    final String? id,
    final String? title,
    final String? description,
    @Uint8ListConverter() Uint8List? photo,
  }) = _NotesModel;

  factory NotesModel.fromJson(Map<String, dynamic> json) => _$NotesModelFromJson(json);
}