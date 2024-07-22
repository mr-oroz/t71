import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:t71/core/theme/app_colors.dart';
import 'package:t71/features/add_game/presentation/pages/add_game_page.dart';
import 'package:t71/features/create_profile/presentation/providers/create_profile_provider.dart';
import 'package:t71/features/home/presentation/pages/history_tab_page.dart';
import 'package:t71/features/home/presentation/pages/upcoming_games_tab_page.dart';
import 'package:t71/features/home/presentation/widgets/home_app_bar.dart';
import 'package:t71/features/notes_achieves/presentaion/providers/note_provider.dart';
import 'package:t71/features/training/presentation/providers/add_workout_provider.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTabController(initialLength: 2);
    ref.watch(addWorkoutProviderProvider);
    ref.watch(noteProviderProvider);
    ref.watch(createProfileProvider);
    return Scaffold(
      appBar: HomeAppbar(controller: controller),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: const [
                    UpcomingGamesTabPage(),
                    HistoryTabPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 5),
        child: Container(
          color: AppColors.blue,
          child: IconButton(
            icon: const Icon(Icons.add, color: AppColors.white,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddGamePage()));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
