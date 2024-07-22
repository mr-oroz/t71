// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/utils/format_date.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/features/training/domain/add_training_model.dart';

class CardTraining extends StatelessWidget {
  const CardTraining({
    super.key,
    required this.item,
  });

  final AddTrainingModel item;

  @override
  Widget build(BuildContext context) {
    final formatd = formatDate(item.date!);
    return Container(
      height: 260,
      padding: EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
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
                    color: AppColors.text2,
                  ),
                  const Gap(10),
                  Text(
                    item.nameCouch ?? '',
                    style: AppFonts.w400f13.copyWith(
                      color: AppColors.text,
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
                    border: Border.all(color: AppColors.text2)),
                child: Center(
                  child: Text(
                    formatd,
                    style: AppFonts.w400f13.copyWith(
                      color: AppColors.text2,
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(15),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.blue2),
                child: Text(
                  item.typeWorkout.toString().toLowerCase(),
                  style: AppFonts.w400f14.copyWith(
                    color: AppColors.blue,
                  ),
                ),
              ),
              Gap(10),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColors.green2),
                child: Text(
                  item.intensiry.toString().toLowerCase(),
                  style: AppFonts.w400f14.copyWith(
                    color: AppColors.green,
                  ),
                ),
              ),
            ],
          ),
          const Gap(15),
          Flexible(
            child: Text(
              item.placeWorkout ?? '',
              style: AppFonts.w400f16.copyWith(
                color: AppColors.text2,
              ),
            ),
          ),
          const Gap(15),
          Flexible(
            child: Text(
              item.note ?? '',
              style: AppFonts.w400f16.copyWith(
                color: AppColors.text2,
              ),
            ),
          ),
          const Gap(15),
          Row(
            children: [
              AppIcon(
                AppIcons.location,
                color: AppColors.text2,
              ),
              const Gap(5),
              Text(
                item.city ?? '',
                style: AppFonts.w400f13.copyWith(
                  color: AppColors.text2,
                ),
              )
            ],
          ),
          const Gap(10),
          Row(
            children: [
              AppIcon(
                AppIcons.watch,
                color: AppColors.text2,
              ),
              const Gap(5),
              Text(
                '${item.timer} PM',
                style: AppFonts.w400f13.copyWith(
                  color: AppColors.text2,
                ),
              ),
              const Gap(5),
              AppIcon(
                AppIcons.stopwatch,
                color: AppColors.text2,
              ),
              Text(
                '${item.duration} h',
                style: AppFonts.w400f13.copyWith(
                  color: AppColors.text2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
