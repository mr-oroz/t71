import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/features/add_game/domain/models/add_game_model.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/add_game/presentation/widgets/calendar_widget.dart';
import 'package:t71/features/home/presentation/widgets/time_line_widget.dart';

class HistoryTabPage extends HookConsumerWidget {
  const HistoryTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addGameProviderProvider);
    final EasyInfiniteDateTimelineController controller =
        EasyInfiniteDateTimelineController();
    
    return ListView(
      children: [
        const Gap(10),
        CalendarWidget(
          controller: controller,
          focusedDay: state.focusedDay!,
        ),
        const Gap(10),
        Column(
          children: List.generate(
            state.historyGames.length,
            (index) {
              return TimeLineWidget(
                selectedInde: 0,
                item: state.historyGames[index],
                index: index,
                last: state.historyGames.length,
              );
            },
          ),
        )
      ],
    );
  }
}
