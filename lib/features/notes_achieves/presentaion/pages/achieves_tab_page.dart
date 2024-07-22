import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/features/notes_achieves/data/achieves_data.dart';

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
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                item.title,
                                style: AppFonts.w500f20,
                              ),
                            ),
                            Gap(10),
                            Flexible(
                              child: Text(
                                item.subTitle,
                                style: AppFonts.w400f14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 5,
                          ),
                          color:
                              item.isActive ? AppColors.blue : AppColors.blue2,
                          border: Border.all(
                            color: AppColors.blue,
                          ),
                        ),
                        child: item.isActive
                            ? AppIcon(
                                AppIcons.approve,
                                color: AppColors.white,
                              )
                            : Container(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
