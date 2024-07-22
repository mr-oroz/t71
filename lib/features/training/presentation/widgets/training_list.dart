import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/features/training/presentation/providers/add_workout_provider.dart';
import 'package:t71/features/training/presentation/widgets/card_training.dart';

class TrainingList extends HookConsumerWidget {
  const TrainingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addWorkoutProviderProvider);
    return ListView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: List.generate(state.workouts.length, (index) {
        return CardTraining(
          item: state.workouts[index],
        );
      }),
    );
  }
}
