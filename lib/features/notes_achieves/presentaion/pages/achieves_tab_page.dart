import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/features/notes_achieves/data/achieves_data.dart';
import 'package:t71/features/notes_achieves/presentaion/widgets/achieves_card.dart';

class AchievesTabPage extends HookConsumerWidget {
  const AchievesTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
      children: List.generate(
        list.length,
        (index) {
          final item = list[index];
          return AchievesCard(item: item);
        },
      ),
    );
  }
}
