import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/features/notes_achieves/domain/achieves_model.dart';

class AchievesCard extends HookConsumerWidget {
  const AchievesCard({
    super.key,
    required this.item,
  });

  final AchievesModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = useState<AchievesModel>(item);
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
                          state.value.title,
                          style: AppFonts.w500f20,
                        ),
                      ),
                      Gap(10),
                      Flexible(
                        child: Text(
                          state.value.subTitle,
                          style: AppFonts.w400f14,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    state.value =
                        state.value.copyWith(isActive: !state.value.isActive);
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width / 5,
                      ),
                      color: state.value.isActive
                          ? AppColors.blue
                          : AppColors.blue2,
                      border: Border.all(
                        color: AppColors.blue,
                      ),
                    ),
                    child: state.value.isActive
                        ? AppIcon(
                            AppIcons.approve,
                            color: AppColors.white,
                          )
                        : Container(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
