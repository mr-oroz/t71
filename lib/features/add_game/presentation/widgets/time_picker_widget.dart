import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';

class TimePickerPage extends HookConsumerWidget {
  const TimePickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hour = useState<int>(10);
    final minute = useState<int>(10);
    final isAM = useState<bool>(true);
    final selectedIndex = useState<int>(0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    buildArrowButton(AppIcons.up, () {
                      hour.value = (hour.value % 12) + 1;
                      ref
                          .read(addGameProviderProvider.notifier)
                          .onHour((hour.value % 12) + 1);
                    }),
                    const Gap(5),
                    Text(hour.value.toString().padLeft(2, '0'),
                        style: const TextStyle(fontSize: 24)),
                    const Gap(5),
                    buildArrowButton(AppIcons.down, () {
                      hour.value = (hour.value == 1) ? 12 : hour.value - 1;
                      ref
                          .read(addGameProviderProvider.notifier)
                          .onHour((hour.value == 1) ? 12 : hour.value - 1);
                    }),
                  ],
                ),
              ),
              const Text(':', style: TextStyle(fontSize: 24)),
              Flexible(
                child: Column(
                  children: [
                    buildArrowButton(AppIcons.up, () {
                      minute.value = (minute.value % 60) + 1;
                      ref
                          .read(addGameProviderProvider.notifier)
                          .onMinute((minute.value % 60) + 1);
                    }),
                    const Gap(5),
                    Text(minute.value.toString().padLeft(2, '0'),
                        style: const TextStyle(fontSize: 24)),
                    const Gap(5),
                    buildArrowButton(AppIcons.down, () {
                      minute.value =
                          (minute.value == 0) ? 59 : minute.value - 1;
                      ref.read(addGameProviderProvider.notifier).onMinute(
                          (minute.value == 0) ? 59 : minute.value - 1);
                    }),
                  ],
                ),
              ),
              ToggleButtons(
                fillColor: AppColors.white,
                borderWidth: 0,
                borderColor: Colors.white,
                renderBorder: false,
                isSelected: [isAM.value, !isAM.value],
                selectedColor: AppColors.text,
                onPressed: (int index) {
                  isAM.value = index == 0;
                  selectedIndex.value = index;
                  ref.read(addGameProviderProvider.notifier).changeTypeTimer(isAM.value);
                },
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'AM',
                      style: AppFonts.w400f20.copyWith(
                        fontSize: 24,
                        color: selectedIndex.value == 0 ? AppColors.text : AppColors.text2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'PM',
                      style: AppFonts.w400f20.copyWith(
                        fontSize: 24,
                        color: selectedIndex.value == 1 ? AppColors.text : AppColors.text2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildArrowButton(AppIcons icon, VoidCallback onPress) {
    return IconButton(
      icon: AppIcon(icon),
      onPressed: onPress,
    );
  }
}
