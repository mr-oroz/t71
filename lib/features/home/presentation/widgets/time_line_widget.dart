import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/utils/format_date.dart';
import 'package:t71/core/widgets/app_button.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/features/add_game/domain/models/add_game_model.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/home/presentation/widgets/custom_dialog_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineWidget extends HookConsumerWidget {
  const TimeLineWidget({
    super.key,
    required this.index,
    required this.last,
    required this.item,
    this.onTapIndex,
    this.onLongIndex,
    required this.selectedInde,
  });

  final AddGameModel item;
  final int last;
  final int index;
  final Function(int index)? onTapIndex;
  final Function(int index)? onLongIndex;

  final int selectedInde;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void toggleActive() {
      onTapIndex?.call(index);
    }

    void _showModalAddCompany(BuildContext context) {
      showDialog(
        context: context,
        barrierColor: AppColors.blue2.withOpacity(0.3),
        useRootNavigator: true,
        builder: (
          context,
        ) {
          return CustomDialogCard(
            item: item,
          );
        },
      );
    }

    void toggleLongActive() {
      ref.read(addGameProviderProvider.notifier).toggleIsReditGame(item);
      _showModalAddCompany(context);
    }

    Color getIndicatorColor() {
      if (item.isRedicActive) {
        return AppColors.blue2;
      } else if (selectedInde == index) {
        return AppColors.blue;
      } else {
        return AppColors.white;
      }
    }

    Color getTextColor() {
      if (item.isRedicActive) {
        return AppColors.blue;
      } else if (selectedInde == index) {
        return AppColors.white;
      } else {
        return AppColors.text2;
      }
    }

    return GestureDetector(
      onTap: () {
        toggleActive();
        _showModalAddCompany(context);
      },
      onLongPress: toggleLongActive,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: index == 0,
        isLast: index == last - 1,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0.1,
          width: 20,
          indicator: Container(
            decoration: BoxDecoration(
              color: selectedInde == index ? AppColors.blue : AppColors.white,
              border: Border.all(
                color: AppColors.blue,
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            width: 20,
            height: 20,
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
        beforeLineStyle: const LineStyle(
          color: AppColors.blue,
          thickness: 2,
        ),
        endChild: Container(
          decoration: BoxDecoration(
              color: getIndicatorColor(),
              borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.only(bottom: 10, left: 15),
          constraints: const BoxConstraints(
            minHeight: 120,
          ),
          child: TimelineContent(
            getIndicatorColor: getTextColor(),
            item: item,
            isActive: selectedInde == index || item.isRedicActive,
          ),
        ),
      ),
    );
  }
}

class TimelineContent extends StatelessWidget {
  final AddGameModel item;
  final bool isActive;
  final Color getIndicatorColor;
  const TimelineContent({
    super.key,
    required this.item,
    required this.isActive,
    required this.getIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    final formatd = formatDate(item.date!);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppIcon(
                    AppIcons.account,
                    color: getIndicatorColor,
                  ),
                  const Gap(10),
                  Text(
                    item.nameOpponent ?? '',
                    style: AppFonts.w400f13.copyWith(
                      color: getIndicatorColor,
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: getIndicatorColor)),
                child: Center(
                  child: Text(
                    formatd,
                    style: AppFonts.w400f13.copyWith(
                      color: getIndicatorColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Gap(15),
          Flexible(
            child: Text(
              item.placeOfName ?? '',
              style: AppFonts.w400f16.copyWith(
                color: getIndicatorColor,
              ),
            ),
          ),
          const Gap(10),
          Row(
            children: [
              AppIcon(
                AppIcons.watch,
                color: getIndicatorColor,
              ),
              const Gap(5),
              Text(
                '${item.timer} PM',
                style: AppFonts.w400f13.copyWith(
                  color: getIndicatorColor,
                ),
              )
            ],
          ),
          Row(
            children: [
              AppIcon(
                AppIcons.location,
                color: getIndicatorColor,
              ),
              const Gap(5),
              Text(
                'New Zeland',
                style: AppFonts.w400f13.copyWith(
                  color: getIndicatorColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
