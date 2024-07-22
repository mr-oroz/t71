import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/add_game/presentation/widgets/calendar_widget.dart';
import 'package:t71/features/home/presentation/widgets/time_line_widget.dart';

class UpcomingGamesTabPage extends HookConsumerWidget {
  const UpcomingGamesTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addGameProviderProvider);
    final EasyInfiniteDateTimelineController controller =
        EasyInfiniteDateTimelineController();
    final focusedDay = useState<DateTime>(DateTime.now());
    final selectedIndex = useState<int>(0);

    void onTapIndex(int index) {
      selectedIndex.value = index;
    }

    void onFilterGame(DateTime selected) {
      ref.read(addGameProviderProvider.notifier).filterGames(selected);
    }


    void onMonthChanged(DateTime month) {
      focusedDay.value = DateTime(month.year, month.month, 1);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.jumpToDate(focusedDay.value);
      });
      ref.read(addGameProviderProvider.notifier).onMonthChanged(month);
      onFilterGame(month);
    }

    
    void onDateChange(DateTime selected) {
      focusedDay.value = selected;
      ref.read(addGameProviderProvider.notifier).onDateChange(selected);
      onFilterGame(selected);
    }

    return ListView(
      children: [
        const Gap(10),
        CalendarWidget(
          onFilterGame: onFilterGame,
          onDateChange: onDateChange,
          onMonthChanged: onMonthChanged,
          focusedDay: state.focusedDay!,
          controller: controller,
        ),
        const Gap(10),
        if (state.filteredGames.isNotEmpty)
          Column(
            children: List.generate(
              state.filteredGames.length,
              (index) {
                return TimeLineWidget(
                  selectedInde: selectedIndex.value,
                  onTapIndex: onTapIndex,
                  item: state.filteredGames[index],
                  index: index,
                  last: state.filteredGames.length,
                );
              },
            ),
          )
        else
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'No notes',
                style: AppFonts.w500f20.copyWith(
                  color: AppColors.text2,
                ),
              ),
            ),
          )
      ],
    );
  }
}
