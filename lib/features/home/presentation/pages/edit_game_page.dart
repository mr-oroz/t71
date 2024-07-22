import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/core/widgets/gl_app_bar.dart';
import 'package:t71/features/add_game/domain/models/add_game_model.dart';
import 'package:t71/features/add_game/presentation/pages/add_game_done_page.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/add_game/presentation/widgets/calendar_widget.dart';
import 'package:t71/features/add_game/presentation/widgets/time_picker_widget.dart';

class EditGamePage extends HookConsumerWidget {
  const EditGamePage({
    super.key,
    required this.item,
  });

  final AddGameModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EasyInfiniteDateTimelineController controller =
        EasyInfiniteDateTimelineController();
    final focusedDay = useState<DateTime>(item.date!);
    void onMonthChanged(DateTime month) {
      focusedDay.value = DateTime(month.year, month.month, 1);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.jumpToDate(focusedDay.value);
      });
      ref.read(addGameProviderProvider.notifier).onMonthChanged(month);
    }

    void onDateChange(DateTime selected) {
      focusedDay.value = selected;
      ref.read(addGameProviderProvider.notifier).onDateChange(selected);
    }

    return Scaffold(
      appBar: GlAppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const AppIcon(
                AppIcons.icon_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add game',
                  style: AppFonts.w500f20,
                ),
                Text(
                  'Select date and time',
                  style: AppFonts.w400f13.copyWith(
                    color: AppColors.text2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          children: [
            Text('Select date', style: AppFonts.w400f14),
            const Gap(15),
            CalendarWidget(
              onDateChange: onDateChange,
              onMonthChanged: onMonthChanged,
              focusedDay: item.date!,
              controller: controller,
            ),
            const Gap(20),
            const TimePickerPage(),
          ],
        ),
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: AppButton(
          height: 56,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddGameDonePage(item: item),
              ),
            );
          },
          title: 'Continue',
          bgColor: AppColors.blue,
          textColor: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
