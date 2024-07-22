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

class CustomDialogCard extends HookConsumerWidget {
  const CustomDialogCard({
    super.key,
    required this.item,
  });

  final AddGameModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final youPoint = useState<int>(0);
    final opponetPoint = useState<int>(0);
    return Dialog(
      backgroundColor: AppColors.white,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(15),
              Text('How did the game go?'),
              Gap(15),
              _buildCard(),
              Gap(15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.blue2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (youPoint.value > 0) {
                            youPoint.value = youPoint.value - 1;
                          }
                        },
                        icon: Icon(Icons.remove)),
                    Text(
                      '${youPoint.value > 0 ? youPoint.value : 'Your points'}',
                      style: AppFonts.w400f13.copyWith(
                        color: AppColors.text2,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          youPoint.value = youPoint.value + 1;
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
              ),
              Gap(15),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.blue2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (opponetPoint.value > 0) {
                            opponetPoint.value--;
                          }
                        },
                        icon: Icon(Icons.remove)),
                    Text(
                      '${opponetPoint.value > 0 ? opponetPoint.value : 'Opponent points'}',
                      style: AppFonts.w400f13.copyWith(
                        color: AppColors.text2,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          opponetPoint.value = opponetPoint.value + 1;
                        },
                        icon: Icon(Icons.add))
                  ],
                ),
              ),
              Gap(15),
              AppButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: 'Didn\'t take place',
                height: 44,
                bgColor: AppColors.blue2,
                textColor: AppColors.text,
              ),
              Gap(15),
              AppButton(
                onPressed: () {
                  ref
                      .read(addGameProviderProvider.notifier)
                      .addHistoryGames(item);
                  ref
                      .read(addGameProviderProvider.notifier)
                      .filterHistory(item.date!);
                  ref.read(addGameProviderProvider.notifier).deleteGame(item.id!);
                  Navigator.of(context).pop();
                },
                title: 'Done',
                height: 44,
                bgColor: AppColors.blue,
                textColor: AppColors.white,
              ),
              Gap(15),
              AppButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                title: 'Skip',
                height: 44,
                bgColor: AppColors.white,
                textColor: AppColors.text,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCard() {
    final formatd = formatDate(item.date!);
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.blue2, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(10),
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
                      item.nameOpponent ?? '',
                      style: AppFonts.w400f13.copyWith(
                        color: AppColors.text2,
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
            const Gap(15),
            Flexible(
              child: Text(
                item.placeOfName ?? '',
                style: AppFonts.w400f16.copyWith(
                  color: AppColors.text2,
                ),
              ),
            ),
            const Gap(10),
            Flexible(
              child: Text(
                item.note ?? '',
                style: AppFonts.w400f16.copyWith(
                  color: AppColors.text2,
                ),
              ),
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
                )
              ],
            ),
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
            )
          ],
        ),
      ),
    );
  }
}
