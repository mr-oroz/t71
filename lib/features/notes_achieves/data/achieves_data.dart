import 'package:t71/features/notes_achieves/domain/achieves_model.dart';

final List<AchievesModel> list = [
  AchievesModel(
      title: 'Win a local tournament',
      subTitle: 'Win a local boxing tournament',
      isActive: false),
  AchievesModel(
      title: 'Complete a match without getting knocked down',
      subTitle: 'Fight an entire match without being knocked down.',
      isActive: true),
  AchievesModel(
      title: 'Improve jab technique',
      subTitle: 'Significantly improve your jabtechnique after training',
      isActive: false),
  AchievesModel(
      title: 'Land 50 punches in one match',
      subTitle: 'Successfully land 50 punches in a single match',
      isActive: true),
  AchievesModel(
      title: 'Defeat a higher-ranked opponent',
      subTitle: 'Defeat an opponent who is ranked higher than you',
      isActive: false),
];
