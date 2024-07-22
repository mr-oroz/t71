import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/core/theme/app_fonts.dart';
import 'package:t71/core/widgets/app_icons.dart';
import 'package:t71/features/add_game/presentation/providers/add_game_provider.dart';
import 'package:t71/features/home/presentation/pages/edit_game_page.dart';

class HomeAppbar extends HookConsumerWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key, required this.controller});
  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addGameProviderProvider).addGames;
    final gameCard = ref.watch(addGameProviderProvider).gameCard;
    
    bool hasActiveGame = state.any((game) => game.isRedicActive);

    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15)
          .copyWith(top: MediaQuery.of(context).padding.top, bottom: 5),
      child: hasActiveGame
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(addGameProviderProvider.notifier).clearActive();
                  },
                  icon: CircleAvatar(
                    backgroundColor: AppColors.blue2,
                    child: AppIcon(
                      AppIcons.close,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditGamePage(
                              item: gameCard!,
                            ),
                          ),
                        );
                        ref
                            .read(addGameProviderProvider.notifier)
                            .clearActive();
                      },
                      icon: CircleAvatar(
                        backgroundColor: AppColors.blue2,
                        child: AppIcon(AppIcons.pencil, color: AppColors.blue),
                      ),
                    ),
                    Gap(10),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(addGameProviderProvider.notifier)
                            .deleteGame(gameCard!.id!);
                        ref
                            .read(addGameProviderProvider.notifier)
                            .clearActive();
                      },
                      icon: CircleAvatar(
                        backgroundColor: AppColors.red2,
                        child: AppIcon(
                          AppIcons.trash,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          : TabBar(
              controller: controller,
              indicatorColor: AppColors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: AppColors.text,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.only(bottom: 10),
              tabs: [
                Text(
                  "Upcoming Games",
                  style: AppFonts.w400f16,
                ),
                Text(
                  'History',
                  style: AppFonts.w400f16,
                ),
              ],
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
