import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    final String? uuid,
    final String? username,
    final String? age,
    @Uint8ListConverter() Uint8List? photo,
    final String? favoriteBeats,
    final String? gameLevel,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);
}



class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    return base64.decode(json);
  }

  @override
  String toJson(Uint8List object) {
    return base64.encode(object);
  }
}
