import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';

class HoteAchievesAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const HoteAchievesAppBar({super.key, required this.controller});
  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15)
          .copyWith(top: MediaQuery.of(context).padding.top, bottom: 5),
      child: TabBar(
        controller: controller,
        indicatorColor: AppColors.blue,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColors.text,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.only(bottom: 10),
        tabs: [
          Text(
            "Notes",
            style: AppFonts.w400f16,
          ),
          Text(
            'Achieves',
            style: AppFonts.w400f16,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
