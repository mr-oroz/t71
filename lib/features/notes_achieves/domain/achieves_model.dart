// ignore_for_file: public_member_api_docs, sort_constructors_first
class AchievesModel {
  final String title;
  final String subTitle;
  final bool isActive;
  AchievesModel({required this.title, required this.subTitle, required this.isActive});

  AchievesModel copyWith({
    String? title,
    String? subTitle,
    bool? isActive,
  }) {
    return AchievesModel(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      isActive: isActive ?? this.isActive,
    );
  }
}
